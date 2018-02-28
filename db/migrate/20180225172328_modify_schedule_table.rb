class ModifyScheduleTable < ActiveRecord::Migration[5.0]
  def change
  	change_column :schedules, :from, :datetime
  	change_column :schedules, :to, :datetime
  	remove_column :schedules, :day
  end
end
