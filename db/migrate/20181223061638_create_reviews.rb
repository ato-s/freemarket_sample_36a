class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.text :text, null: false
      t.integer :evaluation, null: false, default: 0
      t.references :item, foreign_key: true, null:false
      t.references :appraiser, null:false
      t.references :appraisee, null:false
      t.timestamps
    end
  add_foreign_key :reviews, :users, column: :appraiser_id, index:true
  add_foreign_key :reviews, :users, column: :appraisee_id, index:true
  end
end
