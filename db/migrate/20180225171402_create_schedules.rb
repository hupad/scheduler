class CreateSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :schedules do |t|
      t.date :day
      t.time :from
      t.time :to
      t.references :stylist, foreign_key: true

      t.timestamps
    end
  end
end
