class CreditsController < ApplicationController
before_action :confirm_user_sign_in

include Payjp_process

  def index
    @credit_data = show_customer_data
    card_brand_image_src
  end

  def new
    @credit = Credit.new
  end

  def create
      unless current_user.credits.present?
      @credit = Credit.create(credit_params)
        if @credit.save
          redirect_to new_credit_path, alert: "登録が完了しました"
        else
          redirect_to new_credit_path, alert: "登録できませんでした"
        end
      else
        redirect_to new_credit_path, alert: "既に登録されています"
      end
  end

  def destroy
    delete_customer_data
    @credit = Credit.find_by(user_id: current_user.id)
    if @credit.destroy
      redirect_to new_credit_path, alert: "削除しました"
    else
      redirect_to new_credit_path, alert: "削除できませんでした"
    end
  end

  private

  def credit_params
    params.require(:credit).permit(:credit_number,:limit_month,:limit_year,:security_code).merge(customer_id: create_customer.id).merge(user_id: current_user.id)
  end

  def confirm_user_sign_in
    redirect_to new_user_session_path, alert: "ログインして下さい" unless user_signed_in?
  end

end
