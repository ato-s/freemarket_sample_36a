class CreateTransactionMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :transaction_messages do |t|
      t.references :user, foreign_key: true, null:false
      t.references :item, foreign_key: true, null:false
      t.text :text, null:false
      t.timestamps
    end
  end
end
