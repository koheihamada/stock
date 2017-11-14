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
    g = params.require(:image).permit(kind_id: [])
    h = g[:kind_id].last
    params.require(:image).permit(:image).merge(kind_id: h)
  end
end
