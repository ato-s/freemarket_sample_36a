class AreasController < ApplicationController

  def index
    @region_params = params[:region]
    @items = Item.where(delivery_region: @region_params).order("created_at DESC").page(params[:page]).per(80).includes(:pictures)
  end


end
