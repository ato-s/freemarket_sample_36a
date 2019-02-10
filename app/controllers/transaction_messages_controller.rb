class TransactionMessagesController < ApplicationController
  before_action :move_to_sign_in
  before_action :set_item_and_transaction_messages
#  before_action :confirm_buyer_or_seller_include_current_user, except: :create
#  before_action :confirm_transaction_stage_under_transaction, except: :create

  def index
  end

  def create
    @created_transaction_message = TransactionMessage.create(transaction_message_params)
    redirect_to item_path(@item.id)
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
end
