# Write a program that will convert a trinary number, represented as 
# a string (e.g. '102012'), to its decimal equivalent using first 
# principles (without using an existing method or library that can 
# work with numeral systems).

# Trinary numbers can only contain three symbols: 0, 1, and 2. 
# Invalid trinary entries should convert to decimal number 0.

class Trinary

  BASE = 3

  def initialize(string)
    @input_array = string.chars
  end

  def to_decimal
    valid_input? ? convert_valid_input : 0
  end

  def convert_valid_input
    sum = 0
    @input_array.map(&:to_i).reverse.each_with_index do |value, index|
      sum += value * (BASE**index)
    end
    sum
  end

  def valid_input?
    @input_array.each do |char|
      return false if char =~ /[^0-2]/
    end
    true
  end
end