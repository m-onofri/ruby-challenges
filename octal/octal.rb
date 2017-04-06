# Implement octal to decimal conversion. Given an octal input 
# string, your program should produce a decimal output.


# Implement the conversion yourself. Do not use something 
# else to perform the conversion for you. Treat invalid input 
# as octal 0.

class Octal

  BASE = 8

  def initialize(string)
    @input_array = string.chars
  end

  def to_decimal
    valid_input? ? convert_valid_input : 0
  end

  private

  def convert_valid_input
    @input_array
      .map(&:to_i)
      .reverse
      .map.with_index { |value, index| value * (BASE**index) }
      .reduce(&:+)
  end

  def valid_input?
    @input_array.each do |char|
      return false if char =~ /[^0-7]/
    end
    true
  end
end
