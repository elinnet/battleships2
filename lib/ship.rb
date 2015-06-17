
class Ship

  attr_accessor :position, :hit_counter

  def initialize position
    @position = position
    @hit_counter = 0
  end

  def hit
    @hit_counter += 1
  end










end