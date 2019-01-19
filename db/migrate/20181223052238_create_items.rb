class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name, null:false, default: ""
      t.text :description, null:false
      t.integer :state, null:false, default: 0
      t.integer :delivery_payer, null:false, default: 0
      t.integer :delivery_region, null:false, default: 0
      t.integer :delivery_duration, null:false, default: 0
      t.integer :buy_price, null:false, default: 0
      t.integer :sell_price, null:false, default: 0
      t.integer :commission_price, null:false, default: 0
      t.integer :transaction_stage, null:false, default: 0
      t.integer :like_count, null:false, default: 0

      t.references :size, foreign_key: true, null:false, default: 0
      t.references :brand, foreign_key: true, null:false, default: 0
      t.references :upper_category, foreign_key: true, null:false, default: 0
      t.references :middle_category, foreign_key: true, null:false, default: 0
      t.references :lower_category, foreign_key: true, null:false, default: 0
      t.references :seller, null:false, default: 0
      t.references :buyer, null:false, default: 0
      t.timestamps
    end
    add_foreign_key :items, :users, column: :seller_id, index:true
    add_foreign_key :items, :users, column: :buyer_id, index:true
  end
end
