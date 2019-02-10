class CommentsController < ApplicationController
  before_action :move_to_sign_in
  before_action :set_item_and_comments

  def index
  end

  def create
    @created_comment = Comment.create(comment_params)
    redirect_to item_path(@item.id) ,notice: 'メッセージを投稿しました'
  end

    private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_item_and_comments
    @comment =Comment.new
    @item = Item.find(params[:item_id])
    @comments = @item.comments
  end

end
