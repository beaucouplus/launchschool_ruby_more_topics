# About Octal (Base-8):

# Decimal is a base-10 system.

# A number 233 in base 10 notation can be understood as a linear combination of
# powers of 10:

# The rightmost digit gets multiplied by 100 = 1 The next number gets multiplied
# by 101 = 10 ... The n*th number gets multiplied by 10n-1*. All these values
# are summed.

#   233 # decimal
# = 2*10^2 + 3*10^1 + 3*10^0
# = 2*100  + 3*10   + 3*1
# Octal is similar, but uses powers of 8 rather than powers of 10. So:

#   233 # octal
# = 2*8^2 + 3*8^1 + 3*8^0
# = 2*64  + 3*8   + 3*1
# = 128   + 24    + 3
# = 155
require 'pry'

class Octal
  BASE = 8
  attr_reader :number
  def initialize(stringed_num)
    @number = stringed_num.to_i
  end

  def to_decimal
    position = 0
    result = []
    quotient, modulus = number.divmod(10)
    return 0 if modulus > (self.class::BASE - 1)
    loop do
      result << modulus * self.class::BASE ** position
      break if quotient == 0
      quotient, modulus = quotient.divmod(10)
      position += 1
    end
    result.sum
  end

end