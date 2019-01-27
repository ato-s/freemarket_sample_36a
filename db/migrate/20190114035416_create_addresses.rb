class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :first_name, null:false, default: ""
      t.string :last_name, null:false, default: ""
      t.string :first_name_katakana, null:false, default: ""
      t.string :last_name_katakana, null:false, default: ""
      t.string :postal_code, null:false, default: "", limit: 7
      t.integer :prefecture, null:false, default: 0
      t.string :city, null:false, default: ""
      t.string :address, null:false, default: ""
      t.string :building_name, null:false, default: ""
      t.string :landline_number, null:false, default: ""
      t.references :user, foreign_key: true, null:false
      t.timestamps
    end
  end
end
