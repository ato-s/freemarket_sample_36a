class CreateAvatars < ActiveRecord::Migration[5.1]
  def change
    create_table :avatars do |t|
      t.string :content, null:false, default: ""
      t.integer :status, null:false, default: 0
      t.references :user, foreign_key: true, null:false
      t.timestamps
    end
  end
end
