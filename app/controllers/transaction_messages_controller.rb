class TransactionMessagesController < ApplicationController
  before_action :move_to_sign_in
  before_action :set_item
  before_action :set_transaction_messages
  before_action :confirm_buyer_or_seller_include_current_user
  before_action :confirm_transaction_stage_under_transaction

  def index
  end

  def create
    @created_transaction_message = TransactionMessage.create(transaction_message_params)
  end

  private

  def transaction_message_params
    params.require(:transaction_message).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end
  def set_transaction_messages
    @transaction_message = TransactionMessage.new
    @transaction_messages = @item.transaction_messages
  end
  def confirm_transaction_stage_under_transaction
    redirect_to mypages_path unless ['purchased', 'shipping', 'evaluated'].include?(@item.transaction_stage)
  end
end
