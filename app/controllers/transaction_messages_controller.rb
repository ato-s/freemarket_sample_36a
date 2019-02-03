class TransactionMessagesController < ApplicationController
  before_action :set_item_and_transaction_messages
  before_action :confirm_transaction_stage_under_transaction

  def index
  end

  def create
    TransactionMessage.create(transaction_message_params)
  end

  private

  def transaction_message_params
    params.require(:transaction_message).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end
  def set_item_and_transaction_messages
    @transaction_message = TransactionMessage.new
    @item = Item.find(params[:item_id])
    @transaction_messages = @item.transaction_messages
  end
  def confirm_transaction_stage_under_transaction
    redirect_to mypages_path unless @item.transaction_stage == 'under_transaction'
  end
end
