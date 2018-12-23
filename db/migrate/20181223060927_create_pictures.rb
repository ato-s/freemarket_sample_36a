class CreatePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures do |t|
      t.string :content, null:false, default: ""
      t.integer :status, null:false, default: 0
      t.references :item, foreign_key: true
      t.timestamps
    end
  end
end
