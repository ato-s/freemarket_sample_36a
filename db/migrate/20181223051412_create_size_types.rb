class CreateSizeTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :size_types do |t|
      t.string :size_type, null:false, default: ""
    end
  end
end
