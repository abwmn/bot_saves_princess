module Movable
  def displayPathtoPrincess
    while @mario != @peach
      move_mario(get_direction)
      render
      sleep(0.1)
    end
    render
  end

  def get_direction
    @mario[:col] == @peach[:col] ? row_move : col_move
  end
  
  def col_move(mario, peach)
    @mario[:col] - @peach[:col] > 0 ? "LEFT" : "RIGHT"
  end
  
  def row_move(mario, peach)
    @mario[:row] - @peach[:row] > 0 ? "UP" : "DOWN"
  end

  def move_mario(move)
    @moves ||= []
    @moves.push(move)
    hide_mario
    case move
    when "UP"
      @mario[:row] -= 1
    when "DOWN"
      @mario[:row] += 1
    when "LEFT"
      @mario[:col] -= 1
    when "RIGHT"
      @mario[:col] += 1
    end
    place_mario
  end
end