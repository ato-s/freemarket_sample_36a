class BuysController < ApplicationController

before_action :set_item

include Payjp_process

  def edit
    if @item.transaction_stage == "sale"
      @image = Picture.find(params[:item_id])
      @address = Address.find_by(user_id: current_user.id)
      @credit_data = show_customer_data
    else
      redirect_to root_path, alert: "既に販売済みの商品です"
    end
  end

  def update
    if @item.transaction_stage == "sale"
      @buy_price = @item.sell_price
      @buyer_id = current_user.id
      @transaction = @item.update(buy_price: @buy_price, buyer_id: @buyer_id,transaction_stage: 1)
      charge = create_charge(@buy_price)
      redirect_to edit_item_buy_path
    else
      redirect_to root_path, alert:"既に販売済みの商品です"
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

end
