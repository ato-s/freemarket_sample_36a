class CreateUpperCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :upper_categories do |t|
      t.string :name, null:false, default: ""
    end
  end
end
