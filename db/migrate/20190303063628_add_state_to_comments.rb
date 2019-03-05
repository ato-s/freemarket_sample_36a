class AddStateToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :state, :integer , null:false, default: 0
  end
end
