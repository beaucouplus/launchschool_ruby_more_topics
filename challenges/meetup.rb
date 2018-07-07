require 'pry'
class Meetup
  WEEKDAYS = %w(sunday monday tuesday wednesday thursday friday saturday)
  TEENTH = (13..19).to_a
  NEXT_WEEKS = { first: 0, second: 7, third: 14, fourth: 21, last: 28 }
  ONE_WEEK = 7

  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(weekday, schedule)
    @mday = first_mday_of(weekday)
    if schedule == :teenth
      return find_date(:second) if TEENTH.include?(find_date(:second).mday)
      find_date(:third)
    else
      find_date(schedule)
    end
  end

  private
  attr_reader :month, :year, :mday

  def find_date(schedule)
    day = mday + NEXT_WEEKS.fetch(schedule)
    begin
      Date.new(year, month, day)
    rescue 
      Date.new(year, month, day - ONE_WEEK)
    end
  end


  def first_mday_of(weekday)
    day = 1
    first_week_day_of_the_month = Date.new(year, month, day)
    loop do
      break if first_week_day_of_the_month.wday == WEEKDAYS.index(weekday.to_s)
      day += 1
      first_week_day_of_the_month = Date.new(year, month, day)
    end
    first_week_day_of_the_month.mday
  end

end
