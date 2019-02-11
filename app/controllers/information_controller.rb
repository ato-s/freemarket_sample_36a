class InformationController < ApplicationController
  before_action :move_to_sign_in
  before_action :set_todo_and_information
  before_action :set_item, only: [:create]
  before_action :confirm_item_seller, only: [:create]
  after_action :create_information, only: [:create], unless: :information_is_exist?

  def index
  end
  def create
    @information_type = 'be_shiped'
    redirect_to item_transaction_messages_path(@item)
  end

  private

  def confirm_item_seller
    redirect_to item_transaction_messages_path(@item) unless @item.seller == current_user
  end
end
