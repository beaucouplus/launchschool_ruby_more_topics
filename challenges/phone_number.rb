require 'pry'
class PhoneNumber
  def initialize(phone_number)
    @phone_number = phone_number
    self.phone_number = phone_number[1..-1] if prefixed_by_1?
  end

  def number
    return "0" * 10 if invalid?
    stripped_phone_number
  end

  def area_code
    stripped_phone_number[0..2]
  end

  def to_s
    "(#{stripped_phone_number[0..2]}) #{stripped_phone_number[3..5]}-#{stripped_phone_number[6..-1]}"
  end

  private

  def invalid?
    !!phone_number.match(/[a-zA-Z]/) || phone_number.size < 10 ||
      too_many_numbers? || not_prefixed_by_1?
  end

  def prefixed_by_1?
    stripped_phone_number.size == 11 && stripped_phone_number[0] == "1"
  end

  def not_prefixed_by_1?
    stripped_phone_number.size == 11 && stripped_phone_number[0] != "1"
  end

  def too_many_numbers?
    stripped_phone_number.size > 11
  end

  def stripped_phone_number
    phone_number.gsub(/\D/, "")
  end

  attr_accessor :phone_number
end

# If the phone number is less than 10 digits assume that it is bad number
# If the phone number is 10 digits assume that it is good
# If the phone number is 11 digits and the first number is 1, 
# trim the 1 and use the last 10 digits
# If the phone number is 11 digits and the first number is not 1, 
# then it is a bad number
# If the phone number is more than 11 digits assume that it is a bad number