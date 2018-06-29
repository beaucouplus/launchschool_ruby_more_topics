require 'pry'
class BeerSong

  def lyrics
    verses(99, 0)
  end

  def verses(highest, lowest)
    (lowest..highest).to_a.reverse.map { |verse_num| verse(verse_num) }.join("\n")
    # binding.pry
  end

  def verse(number)
    case number
    when (3..99)
      "#{number} bottles of beer on the wall, #{number} bottles of beer.\n" \
        "Take one down and pass it around, #{number - 1} bottles of beer on the wall.\n"
    when 2
      "#{number} bottles of beer on the wall, #{number} bottles of beer.\n" \
        "Take one down and pass it around, #{number - 1} bottle of beer on the wall.\n"
    when 1
      "#{number} bottle of beer on the wall, #{number} bottle of beer.\n" \
        "Take it down and pass it around, no more bottles of beer on the wall.\n"
    when 0
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
        "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    end
  end
end