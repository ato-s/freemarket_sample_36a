class BuysController < ApplicationController

include Payjp_process

  def edit
    @item = Item.find(params[:item_id])
    @image = Picture.find(params[:item_id])
    @address = Address.find_by(user_id: current_user.id)
    @credit_data = show_customer_data
  end

  def update
    @item = Item.find(1)
    @buy_price = @item.sell_price
    @buyer_id = current_user.id
    @transaction = @item.update(buy_price: @buy_price, buyer_id: @buyer_id)
    charge = create_charge(@buy_price)
    redirect_to edit_item_buy_path
  end



end
