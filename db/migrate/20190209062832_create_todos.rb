class CreateTodos < ActiveRecord::Migration[5.1]
  def change
    create_table :todos do |t|
      t.integer :todo_stage
      t.text :text
      t.references :user, foreign_key: true, null:false
      t.references :item, foreign_key: true, null:false
      t.timestamps
    end
  end
end
