module Movable
  def displayPathtoPrincess
    while @mario != @peach
      move = get_direction(@mario, @peach)
      move_mario(move)
      render
      sleep(0.1)
    end
    render
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

  def move_mario(move)
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