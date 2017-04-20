class BeerSong

  VERSES = { many: "#{verse_num} bottles of beer on the wall, #{verse_num} bottles of beer.\n" \
                   "Take one down and pass it around, #{verse_num - 1} bottles of beer on the wall.\n",
             two: "#{verse_num} bottles of beer on the wall, #{verse_num} bottles of beer.\n" \
                  "Take one down and pass it around, #{verse_num - 1} bottle of beer on the wall.\n",
             one: "#{verse_num} bottle of beer on the wall, #{verse_num} bottle of beer.\n" \
                  "Take one down and pass it around, no more bottles of beer on the wall.\n",
             zero: "No more bottles of beer on the wall, no more bottles of beer.\n" \
                   "Go to the store and buy some more, 99 bottles of beer on the wall.\n"}

  def verse(verse_num)
    case verse_num
    when 2 then VERSES[:two]
    when 1 then VERSES[:one]
    when 0 then VERSES[:zero]
    else VERSES[:many]
    end
  end

  def lyrics

  end
end