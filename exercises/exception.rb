# Write a minitest assertion that will fail unless employee.hire raises a
# NoExperienceError exception.


require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class Employee
  def hire
    raise NoExperienceError.new("No experience, lame.")
  end
end

class NoExperienceError < StandardError
end

class EmployeeTest < Minitest::Test
  def test_hire_raises_error
    employee = Employee.new
    assert_raises(NoExperienceError) { employee.hire }
  end
end
