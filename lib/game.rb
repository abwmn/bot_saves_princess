require_relative 'board'

class Game
  attr_reader :board, :moves

  def initialize(mode=["random", "corner"].sample)
    @board = Board.new(mode)
    @moves = 0
  end

  def displayPathtoPrincess
    mario, peach = @board.mario, @board.peach
    while mario != peach
      move = get_direction(mario, peach)
      @board.move_mario(move)
      @moves += 1
      @board.render
      puts "Last move: " + move + "!"
      puts "Moves made: " + @moves
      sleep(0.2)
    end
    @board.render
    puts "Mario: PRINCESS PEACH! IT'S A ME, MARIO!"
    puts "I found you in #{@moves} moves!"
    sleep(1)
    @board.place_peach
    @board.render
    puts "Peach: OH MARIO! I KNEW I COULD COUNT ON YOU TO FIND ME IN THE OPTIMAL NUMBER OF MOVES!"
  end

  def get_direction(mario, peach)
    mario[:col] == peach[:col] ? row_move(mario, peach) : col_move(mario, peach)
  end
  
  def col_move(mario, peach)
    mario[:col] - peach[:col] > 0 ? "LEFT" : "RIGHT"
  end
  
  def row_move(peach_row, mario_row)
    mario[:row] - peach[:row] > 0 ? "UP" : "DOWN"
  end
end