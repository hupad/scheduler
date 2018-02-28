class Appointment < ApplicationRecord
  belongs_to :client
  belongs_to :stylist

  validate :start_time_is_not_past
  validate :appointment_over_an_hour

  after_create :set_reminder

  def when_to_run
  	day_before_appointment = 1.day.from_now
  	self.start_time - day_before_appointment
  end

  def set_reminder
  	Rails.logger.info "============ Send User an SMS or Email as a reminder ============== "
  end
  handle_asynchronously :set_reminder, run_at: Proc.new { |i| i.when_to_run }


  private
  def start_time_is_not_past
    errors.add("Cannot have past dates as start time!") if start_time.to_time.past?
  end

  def appointment_over_an_hour
    hour = 60*60
    errors.add(:base, "End time cannot be more than an hour!!!") if (end_time.to_time >= start_time.to_time + hour)
  end
end
