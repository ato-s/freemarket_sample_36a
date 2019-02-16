class MiddleCategoriesController < ApplicationController
  before_action :set_middle_category, only: [:show]
  layout "include_breadcrumbs"

  def show
    @items = @middle_category.items.order("created_at DESC").page(params[:page]).per(80)
    @middle_category_navi = @middle_category.lower_categories.order("RAND()").limit(9)
  end

  private
    def set_middle_category
      @middle_category = MiddleCategory.find(params[:id])
    end
end
