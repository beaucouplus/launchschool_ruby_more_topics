require 'pry'

class Luhn
  attr_reader :id_number
  def initialize(id_number)
    @id_number = id_number
  end

  def to_s
    id_number.to_s
  end

  def addends
    id_number.to_s.chars.reverse.map.with_index do |digit,idx|
      if idx.odd?
        num = digit.to_i * 2
        num -= 9 if num >= 10
      else
        digit.to_i
      end
    end.reverse
  end

  def checksum
    addends.sum
  end

  def valid?
    quotient, modulus = checksum.divmod(10)
    modulus.zero?
  end

  def self.create(check_number)
    candidate = Luhn.new(check_number)
    return candidate.id_number if candidate.valid?
    check_digit = 0
    loop do
      initial_digits = candidate.to_s.chars
      initial_digits << check_digit.to_s
      next_check_number = initial_digits.join.to_i
      next_candidate = Luhn.new(next_check_number)
      break next_candidate.id_number if next_candidate.valid?
      check_digit += 1
    end
  end

  private

end

# Counting from rightmost digit (which is the check digit) and moving left,
#  double the value of every second digit.
# For any digits that thus become 10 or more, subtract 9 from the result.
# 1111 becomes 2121.
# 8763 becomes 7733 (from 2×6=12 → 12-9=3 and 2×8=16 → 16-9=7).
# Add all these digits together.
# 1111 becomes 2121 sums as 2+1+2+1 to give a checksum of 6.
# 8763 becomes 7733, and 7+7+3+3 is 20.
