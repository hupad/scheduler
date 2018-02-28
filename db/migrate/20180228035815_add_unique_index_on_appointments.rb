class AddUniqueIndexOnAppointments < ActiveRecord::Migration[5.0]
  def change
  	add_index :appointments, [:client_id, :stylist_id, :start_time], unique: true
  end
end
