class OCR

  DIGITS =  { '0' => [' _', '| |', '|_|'],
              '1' => ['  |', '  |'],
              '2' => [' _', ' _|', '|_'],
              '3' => [' _', ' _|', ' _|'],
              '4' => ['|_|', '  |'],
              '5' => [' _', '|_', ' _|'],
              '6' => [' _', '|_', '|_|'],
              '7' => [' _', '  |', '  |'],
              '8' => [' _', '|_|', '|_|'],
              '9' => [' _', '|_|', ' _|'] }

  def initialize(text)
    @text = text.split("\n\n")
    @string_nums = @text.map {|s| s.split("\n") }
    @total_nums = []
    reset_num_line
    separate_numbers_in_multiline
  end

  def convert
    @total_nums.map do |num_row|
      convert_digits_in_a_line(num_row)
    end.join(',')
  end

  private

  def convert_digits_in_a_line(num_row)
    num_row.sort.map do |_, num|
      result = convert_single_digit(num)
      result.empty? ? ['?'] : result.keys.join
    end.join
  end

  def convert_single_digit(num)
    DIGITS.select do |digit, strings|
      num == strings
    end
  end

  def separate_numbers_in_multiline
    @string_nums.each do |line|
      separate_digits_in_a_line(line)
    end
  end

  def separate_digits_in_a_line(line)
    line.each do |row|
      join_rows_of_a_number(row)
    end
    @total_nums << @num_line
    reset_num_line
  end

  def join_rows_of_a_number(row)
    row.chars.each_slice(3).with_index do |number, index|
      cur_row = number.join.chomp
      @num_line[index] << cur_row.rstrip unless cur_row === "   "
    end
  end

  def reset_num_line
    @num_line = Hash.new {|num_line, num| num_line[num] = [] }
  end

end
