class SecretHandshake

  GESTURES = {
    "1" => "wink",
    "10" => "double blink",
    "100" => "close your eyes",
    "1000" => "jump"
  }

  def initialize(number)
    @binary_number = encode(number)
  end

  def commands
    codes = decompose(binary_number)
    result = []
    codes.each { |code| result << GESTURES.fetch(code) }.compact
    result
  end

  private

  attr_reader :binary_number

  def encode(number)
    return number.to_s(2) if number.is_a? Integer
    return 0 if number.to_i.to_s != number
    number.to_i
  end

  def decompose(number)
    changed_order = true if number.to_i >= 10000
    decomposed_num = number.to_s.chars.reverse
                           .map.with_index { |digit,idx| (digit.to_i * 10 ** idx) }
                           .reject { |num| num == 0 || num == 10000 }

    return decomposed_num.map(&:to_s).reverse if changed_order
    decomposed_num.map(&:to_s)
  end
end
