class BrandsController < ApplicationController
  def show
    @brand = Brand.find(params[:id])
    @items = Item.where(brand_id: params[:id])
      @items.each do |item|
       @item = item
      end
  end
end
