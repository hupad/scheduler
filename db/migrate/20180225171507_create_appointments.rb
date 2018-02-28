class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.references :client, foreign_key: true
      t.references :stylist, foreign_key: true
      t.time :start_time
      t.time :end_time
      t.date :day

      t.timestamps
    end
  end
end
