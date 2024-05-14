module Renderable
  def place_peach
    @grid[@peach[:row]][@peach[:col]] = "p"
  end

  def place_mario
    @grid[@mario[:row]][@mario[:col]] = "m"
  end

  def hide_mario
    @grid[@mario[:row]][@mario[:col]] = "-"
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