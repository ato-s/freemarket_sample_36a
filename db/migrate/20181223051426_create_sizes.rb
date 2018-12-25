class CreateSizes < ActiveRecord::Migration[5.1]
  def change
    create_table :sizes do |t|
      t.string :name, null:false, default: ""
      t.references :size_type, foreign_key: true, null:false
    end
  end
end
