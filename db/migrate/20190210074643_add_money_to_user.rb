class AddMoneyToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :money, :string, default: 0
    add_column :users, :point, :string, default: 0
  end
end
