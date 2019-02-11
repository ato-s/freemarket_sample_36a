class CreateUserInformations < ActiveRecord::Migration[5.1]
  def change
    create_table :user_informations do |t|
      t.references :user, foreign_key: true, null:false
      t.references :information, foreign_key: true, null:false
      t.timestamps
    end
  end
end
