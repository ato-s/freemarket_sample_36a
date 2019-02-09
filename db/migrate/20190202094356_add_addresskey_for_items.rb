class AddAddresskeyForItems < ActiveRecord::Migration[5.1]
  def change
    add_reference :items, :shipping_address
    add_foreign_key :items, :addresses, column: :shipping_address_id, index:true
  end
end
