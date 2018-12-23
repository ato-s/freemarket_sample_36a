class CreateTransactionMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :transaction_messages do |t|
      t.references :transaction, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
