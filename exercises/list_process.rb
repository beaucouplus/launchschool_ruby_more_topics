# Write a unit test that will fail if list and the return value of list.process
# are different objects.
require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class List
  def process
    self
  end
end

class ListTest < MiniTest::Test
  def test_different_objects
    list = List.new
    assert_same list, list.process
  end
end
