class CommentsController < ApplicationController
  before_action :move_to_sign_in
  before_action :set_item

  def create
    @created_comment = Comment.create(comment_params)
    @information_type = 'be_commented'
    if information_is_needed? && @item.seller_id != current_user.id
      create_information
    end
    redirect_to item_path(@item.id) ,notice: 'メッセージを投稿しました'
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(state:"1")
    redirect_to item_path(@item.id), notice: "コメントを削除しました"
  end

    private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
