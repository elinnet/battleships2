
class Ship

  attr_reader :position, :hit_counter, :size, :sunk

  def initialize position, size
    @position = position
    @hit_counter = 0
    @size = size
    @sunk = false
  end

  def hit
    @hit_counter += 1
  end

  def destroyed?
   @sunk = true if (@hit_counter == @size)
  end
end
