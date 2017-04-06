# There are 10 types of people in the world: Those who understand binary, and those who don't. 
# You and your fellow cohort of those in the "know" when it comes to binary decide to come up with a secret 
# "handshake".

# 1 = wink
# 10 = double blink
# 100 = close your eyes
# 1000 = jump


# 10000 = Reverse the order of the operations in the secret handshake.

class SecretHandshake

  def initialize(value)
    @value = value.to_i
    @result = []
  end

  def commands
    binary_array = @value.to_s(2).chars.reverse

    binary_array.each_with_index do |char, index|
      case index
      when 0 then @result << 'wink' if char == "1"
      when 1 then @result << 'double blink' if char == "1"
      when 2 then @result << 'close your eyes' if char == "1"
      when 3 then @result << 'jump' if char == "1"
      when 4 then @result.reverse!
      end
    end

    @result
  end

end





