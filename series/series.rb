# Write a program that will take a string of digits and give 
# you all the possible consecutive number series of length n 
# in that string.

# For example, the string "01234" has the following 3-digit 
# series:

# - 012
# - 123
# - 234

# And the following 4-digit series:

# - 0123
# - 1234

# And if you ask for a 6-digit series from a 5-digit string,
# you deserve whatever you get.

class Series
  def initialize(string)
    @numbers = string.chars.map(&:to_i)
  end

  def slices(digit_series)
    if digit_series > @numbers.size
      raise ArgumentError, 'Slices larger than string'
    end

    (0..@numbers.size - digit_series).map do |index|
      @numbers[index, digit_series]
    end
  end
end
