class ItemsController < ApplicationController

  def index
     # @chart_data = SoldPriceForBuy.order('created_at DESC')
     # @chart_data = {'2017-11-20 03:40:34' => 60, '2017-11-20 03:43:02' => 10000, '2017-11-20 03:46:27' => 11000, '2017-11-20 03:47:47' => 100, '2017-11-20 03:47:47' => 100, '2017-11-20 05:58:58' => 1000, '2017-11-20 10:51:41' =>100, '2017-11-20 10:58:13' =>100, '2017-11-21 06:11:56' =>90, '2017-11-21 06:32:30' =>700}
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
