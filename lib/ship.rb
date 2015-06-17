
class Ship

  attr_accessor :position, :status

  def initialize position
    @position = position
    @damaged = false
  end

  # def hit
  #   @status=true
  # end

  def hit
    @damaged  = true
  end

  def hit?
    @damaged
  end






end