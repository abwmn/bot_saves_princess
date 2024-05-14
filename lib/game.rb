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
end