class BrandsController < ApplicationController
  before_action :set_brand, only: [:show]
  layout "include_breadcrumbs"

  def index
  end

  def show
    @items = @brand.items.order("created_at DESC").page(params[:page]).per(80)
    @brand_navi = @brand.groups.order("RAND()").limit(9)
  end


  private
  def set_brand
    @brand = Brand.find(params[:id])
  end
end
