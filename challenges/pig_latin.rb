require 'pry'
class PigLatin
  VOWELS = %w(a e i o u)
  SPECIAL_CASES = %w(yt xr)
  DI_TRI_GRAMMES = %w(ch sch qu squ th thr)

  ENDING = "ay"

  def self.translate(string)
    words = string.split
    words.map { |word| self.pigify(word) }.join(" ")
  end

  def self.pigify(word)
    di_tri_gramme = DI_TRI_GRAMMES.select do |beginning|
      beginning == word[0,2] || beginning == word[0,3]
    end.max

    if VOWELS.include?(word[0].downcase) || SPECIAL_CASES.include?(word[0..1].downcase)
      word << ENDING
    elsif di_tri_gramme
      word[di_tri_gramme.size..-1] << di_tri_gramme << ENDING
    else
      word.chars.rotate.join << ENDING
    end
  end
end
