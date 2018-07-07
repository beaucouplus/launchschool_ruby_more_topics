require 'pry'

module Validable
  def integer?(input)
    Integer(input) rescue false
  end
end
class WordProblem
  include Validable
  INSTRUCTIONS = { "plus" => "+", "minus" => "-",
                   "divided" => "/", "multiplied" => "*" }

  def initialize(instructions)
    @beginners = instructions
    @instructions = instructions.split
                                .map {|item| item.gsub("?", "") }
                                .select { |item| valid_instruction?(item) }
    @register = 0
    @operations = []
  end

  def answer
    raise ArgumentError.new("Unvalid instructions") unless valid_instructions?
    @instructions.each do |item|
      next @register = item.to_i if integer?(item) && @operations.empty?
      next @operations << item if INSTRUCTIONS.include?(item)
      @register = @register.send INSTRUCTIONS[@operations.shift], item.to_i
    end
    @register
  end

  def valid_instructions?
    @instructions.all? { |item| valid_instruction?(item) } && @instructions.size > 2 
  end

  private

  def valid_instruction?(item)
    INSTRUCTIONS.include?(item) || integer?(item)
  end
end
