class AreasController < ApplicationController

  def index
    @region_params = params[:region]
    @items = Item.where(delivery_region: @region_params).includes(:pictures)
  end


end
