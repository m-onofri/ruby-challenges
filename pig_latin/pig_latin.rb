# Pig Latin is a made-up children's language that's 
# intended to be confusing. It obeys a few simple 
# rules (below), but when it's spoken quickly it's 
# really difficult for non-children (and non-native 
#   speakers) to understand.

#     Rule 1: If a word begins with a vowel sound, 
#     add an "ay" sound to the end of the word.
#     Rule 2: If a word begins with a consonant 
#     sound, move it to the end of the word, and 
#     then add an "ay" sound to the end of the word.

class PigLatin

  def self.translate(string)
    words = string.split

    words.map do |word|
      if (word[0] =~ /[b-df-hj-np-tw-z]/ && word[1..2] == 'qu') ||
         ['sch', 'thr'].include?(word[0..2])
        rotate_consonant(word, 3)
      elsif ['th', 'qu', 'ch'].include?(word[0..1])
        rotate_consonant(word, 2)
      elsif %w(a e i o u).include?(word[0]) ||
            %w(xr yt).include?(word[0..1])
        rotate_consonant(word, 0)
      elsif ['xe', 'ye'].include?(word[0..1]) ||
            word[0] =~ /[b-df-hj-np-tw-z]/
        rotate_consonant(word, 1)
      end    
    end.join(" ")
  end

  def self.rotate_consonant(word, num_chars)
    chars = word[0, num_chars]
    word[num_chars..-1] + chars + 'ay'
  end


end







