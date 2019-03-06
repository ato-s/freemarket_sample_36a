class CreateReportComments < ActiveRecord::Migration[5.1]
  def change
    create_table :report_comments do |t|
      t.references :user, foreign_key: true, null:false
      t.references :comment, foreign_key: true, null:false
      t.integer :report_type, null:false, default: 0
      t.text :issue, null:false
      t.timestamps
    end
  end
end
