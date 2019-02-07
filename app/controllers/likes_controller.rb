class LikesController < ApplicationController

  def create
    @like = Like.create(user_id: current_user.id,item_id: params[:item_id])

    @likes = Like.where(item_id: params[:item_id])
    @item = Item.find(params[:item_id])
    @items = Item.all

  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, item_id: params[:item_id]).destroy

    @likes = Like.where(item_id: params[:item_id])
    @item = Item.find(params[:item_id])
    @items = Item.all

  end

end
