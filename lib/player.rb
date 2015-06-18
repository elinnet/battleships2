require_relative 'board'

class Player

  attr_reader :hits, :misses

  def initialize board
    @hits = []
    @misses = []
    @board = board

  end

  def place ship
    @board.place(ship)

  end

  def receive_hit position
    raise "position already struck" if already_struck?(position)
    status = @board.receive_hit(position) 
    if status == 'Hit'
      @hits << position
      return 'Hit! You have lost the game!' if @board.ships_sunk?
      return 'Hit'
    else 
      @misses << position
      return 'Miss'
    end
  end

   private

  def strike_list
    @hits + @misses

  end

  def already_struck? position
    strike_list.include?(position)

  end

end











