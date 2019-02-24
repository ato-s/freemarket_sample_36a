class LikesController < ApplicationController
  before_action :set_item, except: :index
  before_action :confirm_item_seller_is_not_liker, except: :index
  before_action :move_to_sign_in
  layout "mypage", only: :index

  def index
    @likes = current_user.likes.includes([item: :pictures])
  end

  def create
    @like = Like.create(user_id: current_user.id, item_id: params[:item_id])
    @item.reload
    @likes = Like.where(item_id: params[:item_id])
    @information_type = 'be_liked'
    if information_is_needed?
      create_information
    end
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, item_id: params[:item_id]).destroy
    @item.reload
  end

  private

  def confirm_item_seller_is_not_liker
    redirect_to item_path(@item), alert: "出品した商品にいいねすることはできません" if @item.seller == current_user
  end
end
