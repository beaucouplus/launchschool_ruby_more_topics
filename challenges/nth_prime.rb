class Prime

  def self.nth(position)
    raise ArgumentError.new("0 is not a possible position") if position.zero?
    primes = [2, 3, 5, 7, 11, 13]
    if position < 6
      primes[position - 1]
    else
      candidate = 15
      loop do
        primes << candidate if prime?(candidate)
        candidate += 2
        break if primes.size >= position
      end
      primes.last
    end
  end

  def self.has_factors?(number)
    upper_limit = Math.sqrt(number).to_i
    (2..upper_limit).any? do |factor|
      next if factor.even? && factor > 2
      (number % factor).zero?
    end
  end

  def self.prime?(number)
    !has_factors?(number)
  end
end

