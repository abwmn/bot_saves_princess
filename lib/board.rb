class Board
  attr_reader :size, :grid, :mode, :moves 
  attr_accessor :peach, :mario
  
  def initialize
    @grid = generate_grid(@size)
    @moves = []
    place_chars
  end

  def generate_grid(size)
    Array.new(@size) { "-" * @size }
  end

  def move_mario(move)
    hide(@mario)
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
    @moves.push(move)
  end

  def hide(char)
    @grid[char[:row]][char[:col]] = "-"
  end

  def place_mario
    @grid[@mario[:row]][@mario[:col]] = "m"
  end

  def place_peach
    @grid[@peach[:row]][@peach[:col]] = "p"
  end

  def clear
    hide(@peach) ; hide(@mario)
  end

  def render
    puts "\e[H\e[2J"
    @grid.each { |row| puts row }
    puts "\n"
    display_stats
  end

  def display_stats
    puts "Mode: #{@mode}"
    puts "Size: #{@size}"
    puts "Last move: #{@moves.last}!"
    puts "Moves made: #{@moves.length}"
  end
end