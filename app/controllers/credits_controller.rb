class CreditsController < ApplicationController

include Payjp_process

  def new
    @credit = Credit.new
  end

  def create
    @credit = Credit.create(credit_params)
      if @credit.save
        redirect_to new_credit_path
      else
        render :new
      end
  end

#  def index
#    Payjp.api_key = 'sk_test_64c125fb9c7796c255cd46d5'
#    @credit = current_user.credits.first
#    @mycard = Payjp::Customer.retrieve(@credit.customer_id).cards.data[0] if @credit.present?
#  end

#  def destroy
#    @credit = Credit.find(params[:id])
#    @credit.destroy
#    redirect_to new_transaction_credit_path
#  end

  private

  def credit_params
    params.require(:credit).permit(:credit_number,:limit_month,:limit_year,:security_code).merge(customer_id: create_customer.id).merge(user_id: current_user.id)
  end



end
