require 'pry'
class Triangle

  def initialize(rows)
    @rows = rows
    @triangle = []
  end

  def rows
    first_rows = [[1],[1,1]]
    if @rows < 2
      @triangle << first_rows[0]
    else
      @triangle << first_rows[0] << first_rows[1]
    end
    return @triangle if @rows < 3
    rows_number = 3
    loop do
      last_row = @triangle.last
      new_row = []
      new_row << 1
      idx = 0
      loop do
        new_row << last_row[idx, 2].sum
        idx += 1
        break if idx >= last_row.size - 1
      end
      new_row << 1
      @triangle << new_row
      break if rows_number >= @rows
      rows_number += 1
    end
    @triangle
  end

end
