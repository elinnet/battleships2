require_relative 'ship'

class Board

  attr_reader :ship_array, :hits, :misses

  def initialize
    @ship_array = []
  end

  def place 

    ship
    @ship_array << ship
  end

  def receive_hit position 
    @ship_array.each do |ship|
      if ship.position == position
        ship.hit
        ship.destroyed?
        return "Hit"
      end
    end
    return "Missed"
  end

  def ships_sunk?

    @ship_array.each do |ship|
      return false if !ship.sunk
    end

    true
  end

  private

end
