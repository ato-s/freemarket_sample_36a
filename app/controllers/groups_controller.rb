class GroupsController < ApplicationController
  before_action :set_group, only: [:show]
  layout "include_breadcrumbs"

  def show
    @groups = Group.eager_load(:brands)
    @initials = @group.brands.group(:initial_word)
    @brands = @group.brands
  end

  private
  def set_group
    @group = Group.find(params[:id])
  end
end
