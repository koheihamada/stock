class StocksController < ApplicationController

  def index
    @item = Item.all
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
    @payment = Payment.new(confirm_params)
    @payment.save
    @sold_price = SoldPrice.create(sold_price_params)
    sell = SellPrice.all.order("sell_price DESC").last
    sell.destroy
    redirect_to stock_path(params[:item_id])
  end

  def buy
    @buy_price = BuyPrice.new(buy_params)
    @buy_price.save
    redirect_to stock_path(params[:item_id])
  end

  def sell
    @sell_price = SellPrice.new(sell_params)
    @sell_price.save
    @sold_price = SoldPrice.new
    redirect_to stock_path(params[:item_id])
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
    params.require(:payment).permit(:user_id, :item_id, :sell_price_id, :sold_price)
  end

  def sold_price_params
    params.require(:payment).permit(:item_id).merge(sold_price: @payment.sell_price.sell_price, payment_id: @payment.id )
  end
end
