#!/bin/ruby

def displayPathtoPrincess(n,grid)
    directions = case "p"
      when grid[0][0]
        "UP\nLEFT\n"
      when grid[0][-1]
        "UP\nRIGHT\n"
      when grid[-1][0]
        "DOWN\nLEFT\n"
      when grid[-1][-1]
        "DOWN\nRIGHT\n"
    end

    print directions * (n/2)
end

m = gets.to_i

grid = Array.new(m)

(0...m).each do |i|
  grid[i] = gets.strip
end

displayPathtoPrincess(m,grid)