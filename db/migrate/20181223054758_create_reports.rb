class CreateReports < ActiveRecord::Migration[5.1]
  def change
    create_table :reports do |t|
      t.references :user, foreign_key: true, null:false
      t.references :item, foreign_key: true, null:false
      t.timestamps
    end
  end
end
