# Write a minitest assertion that will fail if the value.odd? is not true.
require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class Booltest < Minitest::Test
  def test_value_odd
    value = 5
    assert_equal true, value.odd?
  end

  # Write a minitest assertion that will fail if value.downcase does not return
  # 'xyz'.
  def test_downcase
    value = "XYZ"
    assert_equal "xyz", value.downcase
  end

  def test_nil
    value = nil 
    assert_nil value
  end

  # Write a minitest assertion that will fail if the Array list is not empty.
  def test_empty
    list = []
    assert_empty list
  end

  def test_included
    list = ['zyz', 'abc']
    assert_includes(list, 'zyz')
  end

  
end