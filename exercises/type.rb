# Write a minitest assertion that will fail if value is not an instance of the
# Numeric class exactly. value may not be an instance of one of Numeric's
# superclasses.

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class NumberTest < Minitest::Test
  def test_numeric
    value = Numeric.new
    assert_instance_of Numeric, value
  end

  def test_kind_of_numeric
    value = 5
    assert_kind_of Numeric, value
  end
end