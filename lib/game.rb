require_relative 'board'

class Game
  attr_reader :board, :moves, :mode

  def initialize(mode=["Random", "Corner"].sample)
    @mode = mode
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
      puts "Mode: #{@mode}"
      puts "Size: #{@board.size}"
      puts "Last move: " + move + "!"
      puts "Moves made: #{@moves}"
      sleep(0.1)
    end
    @board.render
    puts "Mario: PRINCESS PEACH! IT'S A ME, MARIO!"
    puts "I found you in #{@moves} moves!"
    sleep(3)
    @board.place_peach
    @board.render
    puts "Mario: PRINCESS PEACH! IT'S A ME, MARIO!"
    puts "I found you in #{@moves} moves!"
    puts "Peach: OH MARIO! I KNEW I COULD COUNT ON YOU TO FIND ME IN THE OPTIMAL NUMBER OF MOVES!\n"
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