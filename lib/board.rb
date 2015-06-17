require_relative 'ship'

class Board

  attr_accessor :ship_array

  def initialize
    @ship_array = []
  end

  def place ship
    @ship_array << ship
  end

  def strike position
    (@ship_array.collect{|x| x.position}.include?(position)) ? "Hit" : "Missed"
  end


end
