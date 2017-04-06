# Write a program that, given a word and a list of 
# possible anagrams, selects the correct sublist 
# that contains the anagrams of the word.

# For example, given the word "listen" and a list 
# of candidates like "enlists" "google" "inlets" 
# "banana" the program should return a list 
# containing "inlets". Please read the test suite 
# for exact rules of anagrams.

class Anagram

  def initialize(string)
    @word = string.downcase
  end

  def match(anagrams_list)
    anagrams_list.select do |anagram|
      next if @word == anagram.downcase
      @word.chars.sort == anagram.downcase.chars.sort 
    end
  end
end
