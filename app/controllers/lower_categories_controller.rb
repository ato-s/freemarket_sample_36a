class LowerCategoriesController < ApplicationController
  before_action :set_lower_category, only: [:show]
  layout "include_breadcrumbs"

  def show
    @items = @lower_category.items.order("created_at DESC").page(params[:page]).per(80)
  end

  private
    def set_lower_category
      @lower_category = LowerCategory.find(params[:id])
    end
end
