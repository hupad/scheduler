class ModifyFromAndToInSchedule < ActiveRecord::Migration[5.0]
  def change
  	rename_column :schedules, :from, :from_time
  	rename_column :schedules, :to, :to_time
  end
end
