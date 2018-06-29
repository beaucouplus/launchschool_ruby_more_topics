class Phrase

  def initialize(sentence)
    @sentence = sentence
  end

  def word_count
    sentence.split(/[^a-zA-Z0-9']/)
            .reject(&:empty?)
            .map { |word| word.downcase.gsub(/(^'|'$)/,'') }
            .each_with_object(Hash.new(0)) { |word, counter| counter[word] += 1 }
  end

  attr_reader :sentence
end
