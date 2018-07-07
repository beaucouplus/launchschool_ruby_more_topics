# When robots come off the factory floor, they have no name.The first time you
# boot them up, a random name is generated, such as RX837 or BC811.

# Every once in a while we need to reset a robot to its factory settings, which
# means that their name gets wiped. The next time you ask, it will respond with
# a new random name.

# The names must be random: they should not follow a predictable sequence.
# Random names means a risk of collisions. Your solution should not allow the
# use of the same name twice when avoidable.

# create a new name with 2 UPCASE letters and 3 digits
# keep this name in an array inside the class
# check if the name is already in the array when asked for new name

class Robot
  LETTERS = ("A".."Z").to_a.freeze
  DIGITS = ("0".."9").to_a.freeze
  
  @@taken_names = []

  attr_reader :name

  def initialize
    @name = reset_name
  end

  def reset
    initialize
  end

  def reset_name
    @@taken_names.delete(name) if @@taken_names.include?(name)
    robot_name = ""
    loop do
      2.times { robot_name << LETTERS.sample }
      3.times { robot_name << DIGITS.sample  }
      break unless @@taken_names.include?(robot_name)
      robot_name.clear
    end
    @@taken_names << robot_name
    robot_name
  end




end