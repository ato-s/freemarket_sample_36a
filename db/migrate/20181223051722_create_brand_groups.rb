class CreateBrandGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :brand_groups do |t|
      t.references :brand, foreign_key: true, null:false
      t.references :group, foreign_key: true, null:false
    end
  end
end
