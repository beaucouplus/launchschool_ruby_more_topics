# In this exercise, your task is to create a new Enumerator object. When
# creating a new Enumerator, you may define what values are iterated upon. We'll
# want to create an Enumerator that can iterate over an infinite list of
# factorials. Once you make this new Enumerator, test it out by printing out the
# first 7 factorial values, starting with zero factorial.
#

factorials = Enumerator.new do |enum|
  a = 1
  enum << 0
  loop do
    factorial = (1..a).reduce(:*)
    enum << factorial
    a += 1
  end
end

7.times do
  p factorials.next
end

factorials.take(7).each do |facto|
  puts facto
end
