# Minesweeper is a popular game where the user has to find the mines 
# using numeric hints that indicate how many mines are directly 
# adjacent (horizontally, vertically, diagonally) to a square.

# In this exercise you have to create some code that counts the 
# number of mines adjacent to a square and transforms boards like 
# this (where * indicates a mine):

# +-----+
# | * * |
# |  *  |
# |  *  |
# |     |
# +-----+

# # into this:

# +-----+
# |1*3*1|
# |13*31|
# | 2*2 |
# | 111 |
# +-----+

class ValueError < RuntimeError

end

class Board

  BOARDERS = ['+', '-', '|'].freeze
  MINE = '*'.freeze
  VALID_CHARS = (BOARDERS + [MINE, ' ']).freeze 

  def self.transform(input_array)
    check_valid_input(input_array)

    input_array.map.with_index do |line, line_index|
      line.chars.map.with_index do |spot, spot_index|
        if !VALID_CHARS.include?(spot)
          raise ValueError, 'There is an invalid character'
        elsif BOARDERS.include?(spot) || spot == MINE
          spot
        else
          tot = count_neighbour_mines(input_array, line_index, spot_index)
          tot == 0 ? " " : tot.to_s
        end
      end.join
    end
  end

  def self.count_neighbour_mines(input, line_index, spot_index)

    neighbour_spots = { up_spot: [line_index - 1, spot_index],
                        upright_spot: [line_index - 1, spot_index + 1],
                        right_spot: [line_index, spot_index + 1],
                        downright_spot: [line_index + 1, spot_index + 1],
                        down_spot: [line_index + 1, spot_index],
                        downleft_spot: [line_index + 1, spot_index - 1],
                        left_spot: [line_index, spot_index - 1],
                        upleft_spot:[line_index - 1, spot_index - 1] }

    neighbour_spots.values.reduce(0) do |tot, (l, s)|
      tot += 1 if input[l][s] == MINE
      tot
    end
  end

  def self.check_valid_input(input)
    if input.map(&:size).uniq.size != 1
      raise ValueError, 'The board size is not correct'
    elsif faulty_border?(input)
      raise ValueError, 'There is an invalid character in the border'
    end
  end

  def self.faulty_border?(input)
    border_chars = input.first + input.last + input.map {|l| l[0] + l[-1]}.join
    return true if border_chars.delete(BOARDERS.join) != ""
    false
  end
end
