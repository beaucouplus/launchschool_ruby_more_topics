require 'pry'
class School

  def initialize
    @grades = {}
  end

  def to_h
    # binding.pry
    grades.sort_by { |grade, students| grade }
          .map { |sub| [sub[0], sub[1].sort] }.to_h
  end

  def add(student, grade)
    grades[grade] ||= []
    grades[grade] << student
  end

  def grade(num)
    grades.fetch(num, [])
  end

  private
  attr_reader :grades

end