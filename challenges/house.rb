require 'pry'

class House
  FIRST_WORDS = "This is"

  def self.recite
    song = House.new
    song.parts
  end

  def parts
    verse = pieces.size - 2
    number_of_verses = 2
    song = []
    song << FIRST_WORDS + " " + pieces.last.first
    loop do
      current_pieces = ([FIRST_WORDS] + pieces[verse, number_of_verses]).flatten
      current_verses = []
      current_pieces.each_slice(2) { |pieces| current_verses << pieces.join(' ') }
      song << current_verses.join("\n")
      verse -= 1
      number_of_verses += 1
      break if verse < 0
    end
    song.join("\n\n") + ("\n")
  end

  private

  def pieces
    [
      ['the horse and the hound and the horn', 'that belonged to'],
      ['the farmer sowing his corn', 'that kept'],
      ['the rooster that crowed in the morn', 'that woke'],
      ['the priest all shaven and shorn', 'that married'],
      ['the man all tattered and torn', 'that kissed'],
      ['the maiden all forlorn', 'that milked'],
      ['the cow with the crumpled horn', 'that tossed'],
      ['the dog', 'that worried'],
      ['the cat', 'that killed'],
      ['the rat', 'that ate'],
      ['the malt', 'that lay in'],
      ['the house that Jack built.']
    ]
  end
end
