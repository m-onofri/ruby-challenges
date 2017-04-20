class BeerSong

  def verse(verse_num)
    case verse_num
    when 2
      "#{verse_num} bottles of beer on the wall, #{verse_num} bottles of beer.\n" \
      "Take one down and pass it around, #{verse_num - 1} bottle of beer on the wall.\n"
    when 1
      "#{verse_num} bottle of beer on the wall, #{verse_num} bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
    when 0
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    else
      "#{verse_num} bottles of beer on the wall, #{verse_num} bottles of beer.\n" \
      "Take one down and pass it around, #{verse_num - 1} bottles of beer on the wall.\n"
    end
  end

  def verses(first, last)
    (last..first)
      .to_a
      .reverse
      .map { |num| verse(num) }
      .join("\n")
  end

  def lyrics
    verses(99, 0)
  end
end