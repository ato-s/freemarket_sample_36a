class CreateInformation < ActiveRecord::Migration[5.1]
  def change
    create_table :information do |t|
      t.integer :information_type
      t.text :text
      t.integer :originally_price, default: 0
      t.integer :changed_price, default: 0
      t.integer :point, default: 0
      t.references :stakeholder
      t.references :related_item
      t.references :created_review
      t.boolean :unread_or_read, null:false, default: false
      t.timestamps
    end
  add_foreign_key :information, :users, column: :stakeholder_id, index:true
  add_foreign_key :information, :items, column: :related_item_id, index:true
  end
end
