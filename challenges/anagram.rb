class Anagram
  attr_reader :word
  def initialize(word)
    @word = word
  end

  def match(candidates)
    candidates.select do |candidate| 
      sort(candidate) == sort(word) && candidate.downcase != word.downcase
    end
  end

  private

  def sort(word)
    word.downcase.chars.sort.join
  end
end
