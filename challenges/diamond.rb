# Requirements
# The first row contains one 'A'.
# The last row contains one 'A'.
# All rows, except the first and last, have exactly two identical letters.
# The diamond is horizontally symmetric.
# The diamond is vertically symmetric.
# The diamond has a square shape (width equals height).
# The letters form a diamond shape.
# The top half has the letters in ascending order.
# The bottom half has the letters in descending order.
# The four corners (containing the spaces) are triangles.

#   A
#  B B
# C   C
#  B B
#   A

#    A > 0
#   B B 1 + 0 > 1 
#  C   C  1 + 2 > 2
#  D     D 1 + 4 > 3
# E       E 1 + 6 > 4
#  D     D
#   C   C
#    B B
#     A

require 'pry'
class Diamond

  def self.make_diamond(letter)
    letters = ("A"..letter).to_a
    first_triangle = letters.map.with_index do |ltr, idx|
      external_spaces = " " * (letters.size - 1 - idx)
      
      if idx.zero?
        external_spaces + ltr + external_spaces + "\n"
        binding.pry
      else
        internal_spaces = " " * (1 + (2 * (idx - 1)))
        external_spaces + ltr + internal_spaces + ltr + external_spaces + "\n"
      end
    end

    (first_triangle + first_triangle.reverse[1..-1]).join
  end
end
