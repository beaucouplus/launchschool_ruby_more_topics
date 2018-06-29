# Write a program that, given a number, can find the sum of all the multiples of
# particular numbers up to but not including that number.

# If we list all the natural numbers up to but not including 20 that are
# multiples of either 3 or 5, we get 3, 5, 6, 9, 10, 12, 15, and 18. The sum of
# these multiples is 78.

# Write a program that can find the sum of the multiples of a given set of
# numbers. If no set of numbers is given, default to 3 and 5.

class SumOfMultiples
  DEFAULTS = [3, 5]

  def self.to(limit, multiples = DEFAULTS)
    (0..limit - 1).select do |num|
      multiples.any? { |default| (num % default).zero? }
    end.sum
  end

  attr_reader :factors
  def initialize(*factors)
    @factors = factors
  end

  def to(limit)
    self.class.to(limit, factors)
  end

end