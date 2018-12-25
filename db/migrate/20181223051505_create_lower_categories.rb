class CreateLowerCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :lower_categories do |t|
      t.string :name, null:false, default: ""
      t.references :middle_category, foreign_key: true, null:false
    end
  end
end
