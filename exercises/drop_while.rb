# The Enumerable#drop_while method begins by iterating over the members of a
# collection, passing each element to the associated block until it finds an
# element for which the block returns false or nil. It then converts the
# remaining elements of the collection (including the element that resulted in a
# falsey return) to an Array, and returns the result.

# Write a method called drop_while that behaves similarly for Arrays. It should
# take an Array as an argument, and a block. It should return all the elements
# of the Array, except those elements at the beginning of the Array that produce
# a truthy value when passed to the block.
  
def drop_while(array)
  dropped = []
  array.each do |item| 
    break unless yield(item)
    dropped << item 
  end
  array - dropped
end

p drop_while([1, 3, 5, 6]) { |value| value.odd? }

p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []