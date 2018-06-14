array = [1, 2, 3, 4, 5]

# Try to write a reduce method on your own that exhibits this behavior. Your
# reduce should take at least 1 argument that represents the array we'll operate
# on. It should also take an optional second argument that represents the
# default value for the accumulator. Here's a few examples that we should be
# able to call on your method.

def reduce(arr, start = arr.first)
  counter = 1
  accumulator = start
  while counter < arr.size
    accumulator = yield(accumulator, arr[counter])
    counter += 1
  end
  accumulator += arr.first if start != arr.first
  accumulator
end

p reduce(array) { |acc, num| acc + num }                    # => 15
p reduce(array, 10) { |acc, num| acc + num }                # => 25
# p reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass

p reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']
