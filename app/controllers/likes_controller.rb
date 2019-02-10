class LikesController < ApplicationController
  before_action :set_item
  after_action :create_information, only: :create, unless: :information_is_exist?

  def create
    @like = Like.create(user_id: current_user.id, item_id: params[:item_id])
    @likes = Like.where(item_id: params[:item_id])
    @information_type = 'be_liked'
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, item_id: params[:item_id]).destroy
  end
end
