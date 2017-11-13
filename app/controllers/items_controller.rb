class ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
      redirect_to :root
  end


  private
  def item_params
    e = params.require(:item).permit(size_id: [])
    f = e[:size_id].last
    g = params.require(:item).permit(color_id: [])
    h = g[:color_id].last
    i = params.require(:item).permit(kind_id: [])
    j = i[:kind_id].last
    params.require(:item).permit(:stock,:retail_price,).merge(size_id: f, color_id: h, kind_id: j)
  end
end
