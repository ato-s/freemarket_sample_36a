class CreateMypages < ActiveRecord::Migration[5.1]
  def change
    create_table :mypages do |t|
      t.text :profile
      t.references :user, foreign_key: true, null:false
      t.timestamps
    end
  end
end
