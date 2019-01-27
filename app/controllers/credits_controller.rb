class CreditsController < ApplicationController

include Payjp_process

  def new
    @credit = Credit.new
  end

  def create
    unless current_user.credits.present?
    @credit = Credit.create(credit_params)
      if @credit.save
        redirect_to new_credit_path
      else
        render :new
      end
    else
      redirect_to root_path
    end
  end

  def destroy
    @credit = Credit.find_by(user_id: current_user.id)
    @credit.destroy
    redirect_to new_credit_path
  end

  private

  def credit_params
    params.require(:credit).permit(:credit_number,:limit_month,:limit_year,:security_code).merge(customer_id: create_customer.id).merge(user_id: current_user.id)
  end

end
