class Board
  attr_reader :size, :grid, :mode, :moves 
  attr_accessor :peach, :mario
  
  def initialize(mode)
    @mode = mode
    @size = (mode == "Random" ? rand(2..49) : 
                      (1..24).map { |i| i * 2 + 1 }.sample)
    @grid = generate_grid(@size)
    @moves = []
    place_chars
  end

  def generate_grid(size)
    Array.new(@size) { "-" * @size }
  end

  def place_chars
    @mode == "Random" ? pick_random : pick_corner
    place_peach
    place_mario
  end
  
  def pick_random
    @peach = @mario = pick_spot
    until @mario != @peach
      @mario = pick_spot
    end
  end

  def pick_spot
    { row: rand(0...@size), col: rand(0...@size) }
  end

  def pick_corner
    edge, center = @size - 1, @size / 2
    @peach = { row: [0, edge].sample, col: [0, edge].sample }
    @mario = { row: center, col: center }
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