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
    @sell = SellPrice.all.order("sell_price DESC").last
    @buy_price = BuyPrice.new
    @buy = BuyPrice.all.order("buy_price DESC").last

    @payment = Payment.new
  end

  def payment
    @payment = Payment.new(payment_params)
    @payment.save
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
    redirect_to stock_path(params[:item_id])
  end

  private
  def kind_params
    a = params.require(:kind).permit(category_id: [])
    b = a[:category_id].last
    c = params.require(:kind).permit(brand_id: [])
    d = c[:brand_id].last
    # e = params.require(:items).permit(size_ids: [])
    # f = e[:size_ids].last
    # g = params.require(:items).permit(color_ids: [])
    # h = g[:color_ids].last
    params.require(:kind).permit(:name,:body,).merge(category_id: b, brand_id: d)
  end

  def sell_params
    params.require(:sell_price).permit(:sell_price, :user_id, :item_id)
  end

  def buy_params
    params.require(:buy_price).permit(:buy_price, :user_id, :item_id)
  end

  def payment_params
    params.require(:payment).permit(:user_id, :item_id, :sell_price_id)
  end
end
