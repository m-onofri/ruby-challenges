# Write a program that given a phrase can count the occurrences of 
# each word in that phrase.

class Phrase

  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    array_words = words_list
    array_words.each_with_object(Hash.new(0)) do |word, hash|
      hash[word] += 1
    end
  end

  private

  def words_list
    @phrase
      .downcase
      .gsub(/[^a-z0-9']/, " ")
      .split
      .map do |word|
        if word[0] == "'" && word[-1] == "'"
          word[1..-2]
        else
          word
        end
      end
  end
end

# phrase = Phrase.new("Joe can't tell between 'large' and large.")
# p phrase.word_count