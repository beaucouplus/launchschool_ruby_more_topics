class Series
  attr_reader :str
  def initialize(str)
    @str = str
  end

  def slices(num)
    raise ArgumentError.new('Slice is bigger that string') if num > str.size
    result = []
    numbers = str.chars
    numbers.each_with_index do |_, index|
      break if index + num > numbers.size
      result << numbers[index,num]
    end
    result.map { |sub| sub.map(&:to_i) }
  end
end

# Create array from string,
# Iterate and keep track of index
# At each index, try to take the n (n being the slice size)
# numbers and keep them in an array
# Break if index + n > array.size

# result = []
# numbers = string.chars

# numbers.each_with_index do |_, index|
#   break if index + num > numbers.size
#   result << numbers[index,num]
# end

# result
