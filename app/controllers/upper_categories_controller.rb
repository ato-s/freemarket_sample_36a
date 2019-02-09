class UpperCategoriesController < ApplicationController
  before_action :set_upper_category, only: [:show]
  layout "include_breadcrumbs"

  def index
  end

  def show
    @items = @upper_category.items.order("created_at DESC").page(params[:page]).per(80)
    @upper_category_navi = @upper_category.middle_categories.order("RAND()").limit(9)
  end

  private
    def set_upper_category
      @upper_category = UpperCategory.find(params[:id])
    end
end
