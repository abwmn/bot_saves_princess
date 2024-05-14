require_relative 'board'
require_relative 'game'

def welcome
  puts "WELCOME TO MARIO'S GROUNDHOG DAY!\n\n"
  sleep(1)
  puts "Watch Mario save the princess from grids of various sizes!"
  sleep(0.5)
  puts "You will witness Mario venture from the center of a grid to a corner to save his Queen,"
  sleep(0.5)
  puts "or he may seek her out from random positions. No matter where Peach awaits him..."
  sleep(1)
  puts "...Mario never fails! Just watch!\n"
  play_or_quit
end

def play_or_quit
  puts "Watch a game? (Y/N)\n"

  yesorno = nil
  until ["y", "Y", "n", "N"].include?(yesorno)
    yesorno = gets.chomp
  end

  yesorno == ("y" || "Y") ? play : quit
end

def play
  game = Game.new
  game.displayPathtoPrincess
  play_or_quit
end

def quit
  puts "\nThanks for watching! See you later!"
  exit
end

welcome
