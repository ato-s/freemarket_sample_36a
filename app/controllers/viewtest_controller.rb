class ViewtestController < ApplicationController
  layout "single", only: [:login, :signup,:signup_registration, :password_reset_start, :sell, :transaction_buy_id, :transaction_address_id, :transaction_card_id, :transaction_selectcard_id]
  def index; end
  def login; end
  def signup; end
  def signup_registration; end
  def u_id; end
  def password_reset_start; end
  def sell; end
  def item_id; end
  def transaction_buy_id; end
  def transaction_address_id; end
  def transaction_card_id; end
  def transaction_selectcard_id; end
  def search_index
    render :search_index, layout: "search"
  end
  def category; end
  def logout
    render :logout, layout: "mypage"
  end
end
