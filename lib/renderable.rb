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
    puts "Mode: #{@mode} ; Size: #{@size}"
    puts "Last move: #{@moves.last} ; Moves made: #{@moves.length}"
    puts "Peach Row: #{@peach[:row]} ; Peach Col: #{@peach[:col]}"
    puts "Mario Row: #{@mario[:row]} ; Mario Col: #{@mario[:col]}"
    puts "Distance to Peach: #{(@peach[:row] - @mario[:row]).abs + (@peach[:col] - @mario[:col]).abs} moves"
  end
end