class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :user_name
      t.string :email
      t.string :phone_number
      t.string :gender
      t.boolean :active, default: false 
      t.string :password_digest
      t.timestamps
    end
  end
end
