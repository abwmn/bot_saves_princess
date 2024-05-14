class Board
  attr_reader :size, :grid
  attr_accessor :peach, :mario
  
  def initialize(mode)
    if mode == "Random" 
      @size = rand(2..49)
      make_random_grid(@size)
    else
      @size = (1..24).map { |i| i * 2 + 1 }.sample
      make_corner_grid(@size)
    end
  end

  def make_random_grid(size)
    @grid = generate_grid(size)
    place_random
  end

  def make_corner_grid(size)
    @grid = generate_grid(size)
    place_corner
  end

  def generate_grid(size)
    Array.new(@size) { "-" * @size }
  end
  
  def place_random
    @peach = @mario = pick_spot
    place_peach
    until @mario != @peach
      @mario = pick_spot
    end
    place_mario
  end

  def pick_spot
    { row: rand(0...@size), col: rand(0...@size) }
  end

  def place_corner
    edge = @size - 1
    @peach = { row: [0, edge].sample, col: [0, edge].sample }
    place_peach
    
    center = @size / 2
    @mario = { row: center, col: center }
    place_mario
  end

  def move_mario(direction)
    hide(@mario)
    case direction
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
  end
end