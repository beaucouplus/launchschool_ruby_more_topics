require 'pry'
class Palindromes

  def initialize(args)
    @max_factor = args.fetch(:max_factor)
    @min_factor = args.fetch(:min_factor, 1)
  end

  def generate
    products = min_factor.upto(max_factor).to_a.map do |factor|
      factor.upto(max_factor).map { |next_factor| factor * next_factor }
    end.flatten.uniq
    @palindromes = products.select { |product| product.to_s.reverse == product.to_s }
  end

  def largest
    Palindrome.new(@palindromes.max, max_factor)
  end

  def smallest
    # binding.pry
    Palindrome.new(@palindromes.min, max_factor)
  end

  private
  attr_reader :min_factor, :max_factor
end

class Palindrome
  attr_reader :value, :max_factor
  def initialize(value, max_factor)
    @value = value
    @max_factor = max_factor
  end

  def factors
    factors = {}
    candidate = max_factor
    loop do
      factor, remainder = value.divmod(candidate)
      if remainder.zero? && factor <= max_factor
        factors[candidate] = factor if factor >= candidate
      end
      candidate -= 1
      break if candidate.zero?
    end
    factors.to_a
  end
end
