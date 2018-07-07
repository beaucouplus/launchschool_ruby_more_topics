require 'pry'

class RunLengthEncoding

  def self.integer?(input)
    Integer(input) rescue false
  end

  def self.encode(text)
    successive_letters = text.squeeze.chars
    result = []
    idx = 0
    successive_letters.each do |sletter|
      found_successive_letters = ""
      text[idx..-1].each_char do |char|
        break idx += found_successive_letters.size if char != sletter
        found_successive_letters << char
      end
      result << found_successive_letters
    end
    new_result = result.map do |letters|
      letter_count = letters.count(letters[0])
      letter_count == 1 ? letters[0] : letter_count.to_s + letters[0]
    end
    new_result.join
  end

  def self.decode(text)
    parts = text.scan(/(\d+.|.)/)
    parts.flatten!.map! { |part| part.size == 1 ? part.prepend("1") : part }
    parts.map! { |part| part[-1] * part[0..-2].to_i }.join
  end
end
