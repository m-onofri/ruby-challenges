class Cipher

  attr_reader :key

  LETTERS = ('a'..'z').to_a
  
  def initialize(user_key = nil)
    @key = user_key.nil? ? make_key : user_key
    raise ArgumentError unless @key =~ /\A[a-z]+\z/
  end

  def encode(string)
    (0...string.size).to_a.map do |index|
      sum = key[index].ord + LETTERS.index(string[index])
      sum = sum > 122 ? 96 + (sum - 122) : sum
      sum.chr
    end.join
  end

  def decode(string)
    (0...string.size).to_a.map do |index|
      sub = LETTERS.index(string[index]) - LETTERS.index(key[index])
      sub = sub < 0 ? 26 + sub : sub 
      LETTERS[sub]
    end.join
  end

  private

  def make_key
    (1..100).to_a.map { |i| LETTERS.sample}.join
  end

end
