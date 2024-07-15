class CreateUserProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :user_profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :address

      t.timestamps
    end
  end
end
