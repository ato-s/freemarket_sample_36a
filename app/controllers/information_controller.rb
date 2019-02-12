class InformationController < ApplicationController
  before_action :move_to_sign_in
  before_action :set_item
  before_action :confirm_item_seller
  before_action :confirm_transaction_stage_purchased

  def create
    update_transaction_stage
    redirect_to item_transaction_messages_path(@item)
  end

  private

  def confirm_item_seller
    redirect_to item_transaction_messages_path(@item) unless @item.seller == current_user
  end
  def confirm_transaction_stage_purchased
    redirect_to item_transaction_messages_path(@item) unless @item.purchased?
  end
end
