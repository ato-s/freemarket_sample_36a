class BuysController < ApplicationController

include Payjp_process

  def edit
    @item = Item.find(1)
    @image = Picture.find(1)
    @address = Address.find(1)
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
