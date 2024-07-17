class CreateAttendances < ActiveRecord::Migration[7.1]
  def change
    create_table :attendances do |t|
      t.references :user, null: false, foreign_key: true
      t.references :warehouse, null: false, foreign_key: true
      t.datetime :check_in_time
      t.datetime :check_out_time
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
