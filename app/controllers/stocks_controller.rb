class StocksController < ApplicationController

  def index
    @item = Item.all


  end

  def search
    @product = Kind.where('name LIKE(?)', "%#{params[:keyword]}%").limit(20)
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
    @buy = BuyPrice.where(item_id: params[:id]).order("buy_price DESC").last
    @payment = Payment.new
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
    @payment = Payment.new(confirm_params)
    if @payment.save
      Payjp.api_key = Rails.application.secrets.PAYJP_SECRET_KEY
      Payjp::Charge.create(currency: 'jpy', amount: @payment.sell_price.sell_price, card: params['payjp-token'])
      @sold_price = SoldPrice.create(sold_price_params)
      sell = SellPrice.where(item_id: params[:item_id]).order("sell_price DESC").last
      sell.destroy
      redirect_to root_path, notice: "支払いが完了しました"
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
  end

  def sell
    @sell_price = SellPrice.new(sell_params)
    if @sell_price.save
    @sold_price = SoldPrice.new
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

  def payment_params
    params.permit(:user_id, :item_id, :sell_price_id)
  end

  def confirm_params
    params.permit(:item_id, :sold_price).merge(sell_price_id: @sell.id, user_id: current_user.id)
  end

  def sold_price_params
    params.permit(:item_id).merge(sold_price: @payment.sell_price.sell_price, payment_id: @payment.id )
  end
end
