require_relative 'ship'

class Board

  attr_accessor :ship_array

  def initialize
    @ship_array = []
  end

  def place ship
    @ship_array << ship
  end

  def strike position #how to make board to ship counter
    @ship_array.each do |ship|
      if ship.position == position
        ship.hit
        return "Hit"
      end
    end
    "Missed"
  end


end
