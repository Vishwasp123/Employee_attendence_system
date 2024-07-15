class AddDeviceTypeToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :device_type, :string
  end
end
