# The following list contains the names of individuals who are pioneers in the
# field of computing or that have had a significant influence on the field. The
# names are in an encrypted form, though, using a simple (and incredibly weak)
# form of encryption called ROT13
require 'pry'
pioneers = File.readlines("pioneers.txt").map(&:chomp)
p pioneers

class DecypherLetter
  ALPHABET = ("a".."z").to_a
  def initialize(letter)
    @letter = letter.downcase
  end

  def decypher
    return " " if !ALPHABET.include?(letter)
    ALPHABET.rotate(ALPHABET.index(letter))[13]
  end

  private
  attr_reader :letter
end
# create an array of alphabet letters
# allow to
a = DecypherLetter.new("p")
puts a.decypher

class DecryptRot13
  def initialize(string)
    @string = string
  end

  def decrypt
    string.chars.map { |letter| DecypherLetter.new(letter).decypher }
    .join.split.map(&:capitalize).join(' ')
  end

  private
  attr_reader :string
end

decyphered = pioneers.map do |pioneer|
  DecryptRot13.new(pioneer).decrypt
end
puts decyphered
