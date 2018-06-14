array = [1, 2, 3, 4, 5]

def select(arr)
  result = []
  counter = 0
  while counter < arr.size
    result << array[counter] if yield(array[counter])
    counter += 1
  end
  result
end



p array.select { |num| num.odd? }       # => [1, 3, 5]
p array.select { |num| puts num }       # => [], because "puts num" returns nil and evaluates to false
p array.select { |num| num + 1 } 