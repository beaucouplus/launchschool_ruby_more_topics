require 'pry'

class Clock
  ONE_HOUR = 60
  ONE_DAY = 1440
  def self.at(hours, minutes = 0)
    Clock.new(hours, minutes)
  end

  attr_accessor :hours, :minutes
  def initialize(hours, minutes)
    @hours = hours
    @minutes = minutes
  end

  def to_s
    "#{format_number(hours)}:#{format_number(minutes)}"
  end

  def format_number(num)
    num < 10 ? '0' + num.to_s : num.to_s
  end

  def +(mins)
    new_time = time_in_minutes + mins
    new_time -= 1440 if new_time > 1440
    self.hours, self.minutes = new_time.divmod(60)
    self
  end

  def -(mins)
    new_time = time_in_minutes - mins
    new_time += 1440 if new_time < 0
    self.hours, self.minutes = new_time.divmod(60)
    self
  end

  def ==(other_clock)
    self.time_in_minutes == other_clock.time_in_minutes
  end

  def time_in_minutes
    hours * ONE_HOUR + minutes
  end
end
