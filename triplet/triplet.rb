# A Pythagorean triplet is a set of three natural numbers, {a, b, c}, 
# for which, a**2 + b**2 = c**2.

# For example, 3**2 + 4**2 = 9 + 16 = 25 = 5**2.

class Triplet

  def self.where(options)
    triplets = []
    max = options.fetch(:max_factor, 10)
    min = options.fetch(:min_factor, 1)
    sum = options.fetch(:sum, 0)

    factors = (min..max).to_a

    factors.combination(3) do |a, b, c|
      triplet = Triplet.new(a, b, c)
      if triplet.pythagorean? &&
         (sum == 0 || triplet.sum == sum)
        triplets << triplet
      end
    end

    triplets
  end

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def sum
    a + b + c
  end

  def product
    a * b * c
  end

  def pythagorean?
    a**2 + b**2 == c**2
  end

  private

  attr_reader :a, :b, :c
end