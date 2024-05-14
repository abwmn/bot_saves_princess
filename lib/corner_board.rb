require_relative 'board'

class CornerBoard < Board
  def initialize
    @size = (1..24).map { |i| i * 2 + 1 }.sample
    @mode = "Corner"
    super
  end

  def place_chars
    edge, center = @size - 1, @size / 2
    @peach = { row: [0, edge].sample, col: [0, edge].sample }
    @mario = { row: center, col: center }
    place_peach ; place_mario
  end
end