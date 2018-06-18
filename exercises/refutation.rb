# Write a unit test that will fail if 'xyz' is one of the elements in the Array
# list:
# 

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class ElementTest < Minitest::Test
  def test_not_an_array_item
    list = ['abc', 'efg']
    refute_includes(list, 'xyz')
  end
end