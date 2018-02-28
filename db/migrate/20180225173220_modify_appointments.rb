class ModifyAppointments < ActiveRecord::Migration[5.0]
  def change
  	change_column :appointments, :start_time, :datetime
  	change_column :appointments, :end_time, :datetime
  	remove_column :appointments, :day
  end
end
