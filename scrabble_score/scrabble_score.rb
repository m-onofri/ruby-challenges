class Scrabble
  def initialize(word)
    @word = word
  end

  def score
    return 0 if @word.nil?
    @word.chars.reduce(0) do |sum, char|
      sum += check_char(char)
      sum
    end
  end

  def self.score(word)
    scrabble_score = Scrabble.new(word)
    scrabble_score.score
  end

  private

  def check_char(char)
    case char.upcase
    when 'A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T' then 1
    when 'D', 'G' then 2
    when 'B', 'C', 'M', 'P' then 3
    when 'F', 'H', 'V', 'W', 'Y' then 4
    when 'K' then 5
    when 'J', 'X' then 8
    when 'Q', 'Z' then 10
    else 0
    end
  end
end
