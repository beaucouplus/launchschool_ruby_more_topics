# Letter                           Value
# A, E, I, O, U, L, N, R, S, T       1
# D, G                               2
# B, C, M, P                         3
# F, H, V, W, Y                      4
# K                                  5
# J, X                               8
# Q, Z                               10
require 'pry'

class Scrabble
  SCORES = {
    1 => %w(A E I O U L N R S T),
    2 => %W(D G),
    3 => %w(B C M P),
    4 => %w(F H V W Y),
    5 => %w(K),
    8 => %w(J X),
    10 => %w(Q Z)
  }
  attr_reader :word
  def initialize(word)
    @word = word
  end

  def score
    self.class.score(word)
  end

  def self.score(word)
    return 0 unless word
    return 0 if word.empty? || word.upcase.chars.any? { |letter| letter.match(/[^A-Z]/) }
    letters = word.upcase.chars
    letters.map do |letter| 
      SCORES.select { |value, letters| letters.include?(letter) }.keys.first
    end.sum
  end

end
