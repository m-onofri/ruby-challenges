# The Romans wrote numbers using letters - I, V, X, L, C, D, M. 
# (notice these letters have lots of straight lines and are hence 
# easy to hack into stone tablets).

# There is no need to be able to convert numbers larger than about 
# 3000. (The Romans themselves didn't tend to go any higher)

class Integer

  def to_roman

    current_value = self

    [1000, 100, 10, 1]
      .map do |value|
        result = current_value / value
        current_value -= (result * value)
        result
      end
      .map.each_with_index do |value, index|
        case index
        when 0 then 'M' * value
        when 1 then convert(value, 'C', 'D', 'M')
        when 2 then convert(value, 'X', 'L', 'C')
        when 3 then convert(value, 'I', 'V', 'X')
        end
      end
      .join
  end

  private

  def convert(value, letter, five_letter, ten_letter)
    case value
    when 1..3 then letter * value
    when 4...5 then letter + five_letter
    when 5...6 then five_letter
    when 6..8 then five_letter + (letter * (value - 5))
    when 9...10 then letter + ten_letter
    else ''
    end
  end

end
