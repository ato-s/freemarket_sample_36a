class ReportsController < ApplicationController

  layout "single"
  before_action :set_item
  before_action :move_to_sign_in
  before_action :confirm_buyer_already_create_report, only: [:create]

  def new
    @report = Report.new
  end

  def create
    @report = Report.new(user_id: current_user.id, item_id: params[:item_id],report_type: params[:report_type])
    if @report.save
      redirect_to item_path(@item), notice: "問題を報告しました"
    else
      redirect_to new_item_report_path(@item),notice:"違反の種類を選択して下さい"
    end
  end

  def destroy
    Report.find_by(user_id: current_user.id, item_id: params[:item_id]).destroy
  end

private

  def confirm_buyer_already_create_report
        redirect_to item_path(@item), notice: "既に報告済みです" if @item.reports.exists?(user_id: current_user.id)
  end

end
