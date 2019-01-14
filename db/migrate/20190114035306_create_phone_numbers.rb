class CreatePhoneNumbers < ActiveRecord::Migration[5.1]
  def change
    create_table :phone_numbers do |t|
      t.string :number, null:false, unique: true
      t.integer :verification_code
      t.integer :verification_code_confirmation
      t.boolean :verified, null:false, default: false
      t.references :user, foreign_key: true, null:false
      t.timestamps
    end
  end
end
