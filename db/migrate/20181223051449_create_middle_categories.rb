class CreateMiddleCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :middle_categories do |t|
      t.string :name, null:false, default: ""
      t.references :upper_category, foreign_key: true, null:false
      t.references :size_type, foreign_key: true, null:false
    end
  end
end
