class GroupsController < ApplicationController
  before_action :set_group, only: [:show]
  layout "include_breadcrumbs"

  def show
    @groups = Group.eager_load(:brands)
    @brands = @group.brands
    @ununique_initials = @brands.pluck(:initial_word)
    @initials = @ununique_initials.uniq
    find_border_of_different_initial
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def find_border_of_different_initial
    @initial_index =[]
    @previous_initial = nil
    @ununique_initials.each_with_index do |ununique_initial, index|
      if @previous_initial != ununique_initial
        @initial_index << index
        @previous_initial = ununique_initial
      end
    end
  end
end
