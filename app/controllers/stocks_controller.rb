class StocksController < ApplicationController

  def index
    @item = Item.all.includes(:sold_price_for_sells, :color, {kind: [:images, :brand]})
    chart_data = SoldPriceForBuy.order('created_at DESC')
    @chart_data = []
      chart_data.each do | chart |
        datas = []
       created_at = chart.created_at
        sold_price = chart.sold_price
        datas << created_at
        datas << sold_price
        @chart_data << datas
      end
  end

  def search
    @product = Kind.where('name LIKE(?)', "%#{params[:keyword]}%").limit(20)
    @brand = Brand.all.includes(:kinds)
  end

  def new
    @stock = Kind.new
    @stock.items.build
  end

  def create
    @stock = Kind.new(kind_params)
    @stock.save
      redirect_to :root
  end

  def show
    @item = Item.find(params[:id])
    @sell_price = SellPrice.new
    @sell = SellPrice.where(item_id: params[:id]).order("sell_price DESC").last
    @buy_price = BuyPrice.new
    @buy = BuyPrice.where(item_id: params[:id]).order("buy_price ASC").last
    @payment = Payment.new
    chart_data = SoldPriceForBuy.order('created_at DESC')
    @chart_data = []
      chart_data.each do | chart |
        datas = []
       created_at = chart.created_at
        sold_price = chart.sold_price
        datas << created_at
        datas << sold_price
        @chart_data << datas
      end
  end

  def payment
    @payment = Payment.new(payment_params)
    @item = Item.find(params[:item_id])
    @sell = SellPrice.find(params[:sell_price_id])
    @user = current_user
  end

  def payment_confirm
    @user = current_user
    @item = Item.find(params[:item_id])
    @sell = SellPrice.where(item_id: params[:item_id]).order("sell_price DESC").last
    @payment = Payment.new(payment_confirm_params)
    if @payment.save
      Payjp.api_key = Rails.application.secrets.PAYJP_SECRET_KEY
      Payjp::Charge.create(currency: 'jpy', amount: @payment.sell_price.sell_price, card: params['payjp-token'])
      PaymentMailer.payment_email(current_user, @payment).deliver
      ShipmentMailer.shipment_email(@payment).deliver
      @sold_price = SoldPriceForSell.create(sold_price_for_sell_params)
      sell = SellPrice.where(item_id: params[:item_id]).order("sell_price DESC").last
      sell.destroy
    else
      redirect_to root_path, notice: "matigae"
    end
  end

  def buy
    @buy_price = BuyPrice.new(buy_params)
    @buy_price.save
    redirect_to stock_path(params[:item_id])
  end

  def selling
    @selling = Selling.new(selling_params)
    @item = Item.find(params[:item_id])
    @user = current_user
    @buy = BuyPrice.find(params[:buy_price_id])
  end

  def selling_confirm
    @user = current_user
    @item = Item.find(params[:item_id])
    @buy = BuyPrice.where(item_id: params[:item_id]).order("buy_price ASC").last
    @selling = Selling.new(selling_confirm_params)
    if @selling.save
      @sold_price = SoldPriceForBuy.create(sold_price_for_buy_params)
      buy = BuyPrice.where(item_id: params[:item_id]).order("buy_price ASC").last
      buy.destroy
    end
  end

  def sell
    @sell_price = SellPrice.new(sell_params)
    if @sell_price.save
    @sold_price = SoldPriceForSell.new
    redirect_to stock_path(params[:item_id])
    else
      redirect_to stock_path(params[:item_id]), alert: "５０以上にしてね"
    end
  end


  private
  def kind_params
    a = params.require(:kind).permit(category_id: [])
    b = a[:category_id].last
    c = params.require(:kind).permit(brand_id: [])
    d = c[:brand_id].last
    params.require(:kind).permit(:name,:body,).merge(category_id: b, brand_id: d)
  end

  def sell_params
    params.require(:sell_price).permit(:sell_price, :user_id, :item_id)
  end

  def buy_params
    params.require(:buy_price).permit(:buy_price, :user_id, :item_id)
  end

  def selling_params
    params.permit(:user_id, :item_id, :buy_price_id)
  end

  def payment_params
    params.permit(:user_id, :item_id, :sell_price_id)
  end

  def selling_confirm_params
    params.permit(:item_id, :sold_price).merge(buy_price_id: @buy.id, buyer_user_id: @buy.user.id, user_id: current_user.id)
  end

  def payment_confirm_params
    params.permit(:item_id, :sold_price).merge(sell_price_id: @sell.id, seller_user_id: @sell.user_id, user_id: current_user.id)
  end

  def sold_price_for_sell_params
    params.permit(:item_id).merge(sold_price: @payment.sell_price.sell_price, payment_id: @payment.id )
  end
  def sold_price_for_buy_params
    params.permit(:item_id).merge(sold_price: @selling.buy_price.buy_price, selling_id: @selling.id )
  end
end
