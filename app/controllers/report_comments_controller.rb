class ReportCommentsController < ApplicationController

  layout "single"
  before_action :set_item
  before_action :set_comment
  before_action :move_to_sign_in
  before_action :confirm_buyer_already_create_report, only: [:create]

  def new
    @report_comment = ReportComment.new
  end

  def create
    @report_comment = ReportComment.new(user_id: current_user.id, comment_id: params[:comment_id],report_type: params[:report_comment][:report_type],issue: params[:report_comment][:issue])
    if @report_comment.save
      redirect_to item_path(@item), notice: "不適切なコメントを報告しました"
    else
      redirect_to new_item_comment_report_comment_path(@item,@comment),notice:"違反の種類の選択/お問い合わせ内容を記入して下さい"
    end
  end

  def destroy
    ReportComment.find_by(user_id: current_user.id, comment_id: params[:comment_id]).destroy
  end

private

  def set_comment
    @comment = Comment.find(params[:comment_id])
  end

  def confirm_buyer_already_create_report
    redirect_to item_path(@item), notice: "既に報告済みです" if @comment.report_comments.exists?(user_id: current_user.id)
  end

end
