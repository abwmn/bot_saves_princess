require_relative 'board'

class RandomBoard < Board
  def initialize
    @size = rand(2..49)
    @mode = "Random"
    super
  end

  def place_chars
    @peach = @mario = pick_spot
    until @mario != @peach
      @mario = pick_spot
    end
    place_peach ; place_mario
  end

  def pick_spot
    { row: rand(0...@size), col: rand(0...@size) }
  end
end