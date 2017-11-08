class StocksController < ApplicationController

  def index
    @item = Item.all
  end
end
