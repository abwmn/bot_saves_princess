require_relative 'board'
require_relative 'random_board'
require_relative 'corner_board'

class Game
  attr_reader :board

  BOARDS = { random: RandomBoard, corner: CornerBoard }.freeze

  def initialize()
    mode = [:random, :corner].sample
    @board = BOARDS[mode].new
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