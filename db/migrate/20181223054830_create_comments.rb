class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true
      t.references :item, foreign_key: true
      t.text :text, null:false
      t.timestamps
    end
  end
end
