require_relative 'board'

class Game
  attr_reader :board, :moves, :mode

  def initialize()
    @mode = ["Random", "Corner"].sample
    @board = Board.new(@mode)
  end

  def displayPathtoPrincess
    mario, peach = @board.mario, @board.peach
    while mario != peach
      move = get_direction(mario, peach)
      @board.move_mario(move)
      @board.render
      sleep(0.1)
    end
    @board.render
  end

  def get_direction(mario, peach)
    mario[:col] == peach[:col] ? row_move(mario, peach) : col_move(mario, peach)
  end
  
  def col_move(mario, peach)
    mario[:col] - peach[:col] > 0 ? "LEFT" : "RIGHT"
  end
  
  def row_move(mario, peach)
    mario[:row] - peach[:row] > 0 ? "UP" : "DOWN"
  end
end