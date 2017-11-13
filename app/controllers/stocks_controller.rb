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
    binding.pry
    @stock.save
      redirect_to :root
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
end
