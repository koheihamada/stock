class UsersController < ApplicationController

  def show
    @user = current_user
    @sell = current_user.sell_prices.includes(:item, {item: :kind}, {item:{kind: :images}})
    @buy = current_user.buy_prices.includes(:item, {item: :kind})
  end


  def destroy
    if params[:sell_price]
      @sell = SellPrice.find(params[:id])
      @sell.destroy
      redirect_to user_path(current_user.id)
    else
      @buy = BuyPrice.find(params[:id])
      @buy.destroy
      redirect_to user_path(current_user.id)
    end
  end

end
