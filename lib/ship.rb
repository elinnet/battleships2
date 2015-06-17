
class Ship

  attr_accessor :position, :hit_counter, :size

  def initialize position
    @position = position
    @hit_counter = 0
    @size = 0
  end

  def hit
    @hit_counter += 1
  end

  def size size
    @size = size
  end
end
