# Typically meetups happen on the same day of the week.

# Examples are

#     the first Monday
#     the third Tuesday
#     the Wednesteenth
#     the last Thursday

# Note that "Monteenth", "Tuesteenth", etc are all made up words. 
# There was a meetup whose members realised that there are exactly 
# 7 days that end in '-teenth'. Therefore, one is guaranteed that 
# each day of the week (Monday, Tuesday, ...) will have exactly one 
# date that is named with '-teenth' in every month.

# Write code that calculates date of meetups.

require 'date'

class Meetup

  TEENTH_DAY = [13, 14, 15, 16, 17, 18, 19].freeze

  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(weekday, schedule)
    @weekday = weekday.to_s.capitalize
    day = case schedule
    when :first then day_counter(1)
    when :second then day_counter(2)
    when :third then day_counter(3)
    when :fourth then day_counter(4)
    when :last then last_day
    when :teenth then teenth
    end
    Date.new(@year, @month, day)
  end

  private

  def teenth
    TEENTH_DAY.each do |day|
      return day if is_the_day?(day)
    end 
  end

  def day_counter(nth_day)
    counter = 0
    (1..31).each do |day|
      counter += 1 if is_the_day?(day)
      return day if counter == nth_day
    end
  end

  def last_day
    -1.downto(-7).each do |day|
      if is_the_day?(day)
        return Date.new(@year, @month, day).strftime("%-d").to_i
      end
    end
  end

  def is_the_day?(day)
    Date.new(@year, @month, day).strftime("%A") == @weekday
  end

end

# p Meetup.new(3, 2013).day(:monday, :first)

