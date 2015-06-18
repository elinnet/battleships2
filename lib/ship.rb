
class Ship

  attr_reader :position, :hit_counter, :size

  def initialize position
    @position = position
    @hit_counter = 0
    @size = 1
  end

  def hit
    @hit_counter += 1
  end

  def set_size size
    @size = size
  end

  # def destroyed
  #   @hit_counter == @size ? true : false
  # /end

  def destroyed?
   @hit_counter == @size
  end
end
