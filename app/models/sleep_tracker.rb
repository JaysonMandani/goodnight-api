class SleepTracker < ApplicationRecord
  belongs_to :user

  before_create :set_clock_in

  def set_clock_in
    self.clock_in = Time.now
  end

  def clock_out!
    time_out = Time.now
    update!(clock_out: time_out, duration: (time_out - clock_in))
  end
end
