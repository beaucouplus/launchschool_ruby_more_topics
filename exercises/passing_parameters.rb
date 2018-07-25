items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) { puts |items| "#{items.join(', ')}" }

gather(items) do |*array, wheat|
  puts "#{array.join(", ")}" 
  puts wheat
end
# Let's start gathering food.
# apples, corn, cabbage
# wheat
# We've finished gathering!
gather(items) do | apples, *array, wheat |
  puts apples
  puts "#{array.join(", ")}"
  puts wheat
end
# Let's start gathering food.
# apples, corn, cabbage
# wheat
# We've finished gathering!

gather(items) do |apples ,*array |
  puts apples
  puts "#{array.join(", ")}"
end

gather(items) do |apples ,corn , cabbage, wheat|
  puts "#{apples}, #{corn}, #{cabbage}, #{wheat}"
end

raven, finch, *raptors = %w(raven finch hawk eagle)
p raven # => 'raven'
p finch # => 'finch'
p raptors  # => ['hawk','eagle']
# Based on the examples shown above, write a method that takes an array as an
# argument. The method should yield the contents of the array to a block, which
# should assign your block variables in such a way that it ignores the first two
# elements, and groups all remaining elements as a raptors array.
birds = %w(raven finch hawk eagle)
def raptors(array)
  yield(array)
end

p raptors(birds) { |array| array.drop(2) }
