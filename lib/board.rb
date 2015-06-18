require_relative 'ship'

class Board

  attr_reader :ship_array

  def initialize
    @ship_array = []
    @hits = []
    @misses = []
  end

  def place ship
    @ship_array << ship
  end

  def strike position #how to make board to ship counter
    raise "position already struck" if strike_list.include? position

    @ship_array.each do |ship|
      if ship.position == position
        ship.hit
        @hits << position
        return "Hit"
      end
    end
    @misses << position
    return "Missed"
  end

  def ships_sunk?

    ship_array.each do |ship|
      return false if !ship.destroyed?
    end

    true
  end

  private

  def strike_list
    @hits + @misses

  end





end
