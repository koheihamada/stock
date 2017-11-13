class ImagesController < ApplicationController

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    @image.save
      redirect_to :root
  end


  private
  def image_params
    g = params.require(:image).permit(item_id: [])
    h = g[:item_id].last
    params.require(:image).permit(:image).merge(item_id: h)
  end
end
