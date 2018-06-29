require 'pry'

class PerfectNumber

  def self.classify(number)
    raise RuntimeError.new("Not a valid number") if number < 0
    sum_of_factors = self.sum_of_factors(number) 
    return "abundant" if sum_of_factors > number 
    return "deficient" if sum_of_factors < number
    "perfect"
  end

  def self.sum_of_factors(number)
    (1...number).select { |candidate| (number % candidate).zero? }.sum
  end
end
