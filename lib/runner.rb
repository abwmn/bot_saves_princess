require_relative 'board'
require_relative 'game'

def welcome
  puts "\e[H\e[2J"
  puts "WELCOME TO MARIO'S GROUNDHOG DAY!\n\n"
  sleep(1.5)
  puts "Watch Mario save the princess from grids of various sizes!"
  sleep(1)
  puts "You will witness Mario venture from the center of a grid to a corner to save his Queen,"
  sleep(1)
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
  board = game.board
  board.displayPathtoPrincess
  puts "Mario: PRINCESS PEACH! IT'S A ME, MARIO!"
  sleep(1)
  puts "I found you in #{board.moves.length} moves!"
  sleep(1)
  board.place_peach
  board.render
  puts "Mario: PRINCESS PEACH! IT'S A ME, MARIO!"
  puts "I found you in #{board.moves.length} moves!"
  puts "Peach: OH MARIO! I KNEW I COULD COUNT ON YOU TO FIND ME IN THE OPTIMAL NUMBER OF MOVES!\n"
  puts "Thanks for watching!"
  play_or_quit
end

def quit
  puts "\nOkey dokey! See you later!"
  exit
end

welcome
