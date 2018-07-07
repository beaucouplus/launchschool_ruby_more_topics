require 'pry'
class Crypto

  def initialize(text)
    @text = text
    @rectangle = Rectangle.new(normalize_plaintext.size)
  end

  def normalize_plaintext
    text.downcase.strip.gsub(/\W/,'')
  end

  def size
    @rectangle.size
  end

  def ciphertext
    ciphered_array.join
  end

  def ciphered_array
    encrypted = []
    rectangle.size.times do |idx|
      encrypted << column(idx)
    end
    encrypted
  end

  def normalize_ciphertext
    ciphered_array.join(' ')
  end

  def plaintext_segments
    lines = []
    counter = 0
    rectangle.width.times do
      lines << normalize_plaintext[counter, rectangle.size] #.ljust(rectangle.size)
      counter += rectangle.size
    end
    lines
  end

  def column(idx)
    plaintext_segments.map { |word| word[idx] }.join
  end

  private
  attr_reader :text, :rectangle
end


class Rectangle
  attr_reader :size, :width

  def initialize(text_size)
    @text_size = text_size
    @size = nearest_int_above_size_sqrt
    @width = length_or_length_minus_1
  end

  private

  attr_reader :text_size

  def nearest_int_above_size_sqrt
    Math.sqrt(text_size).ceil
  end

  def length_or_length_minus_1
    size * (size - 1) >= text_size ? size - 1 : size
  end
end