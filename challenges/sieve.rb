require 'pry'

class Sieve
  attr_reader :nums
  def initialize(limit)
    @nums = (2..limit).to_a
  end

  def primes
    primes = []
    loop do
      primes << nums.shift
      nums.reject! { |num| (num % primes.last).zero? }
      break if nums.empty? 
    end
    primes
  end
end
