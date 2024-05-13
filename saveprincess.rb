#!/bin/ruby

def displayPathtoPrincess(n,grid)
    peach, mario = nil, nil
  
    grid.each_with_index do |row, y|
        unless peach
          peach = row.index("p") 
          peach = [peach, y] if peach
        end

        unless mario
          mario = row.index("m")
          mario = [mario, y] if mario
        end

        break if peach && mario
    end
  
    dx = mario[0] - peach[0]
    dy = mario[1] - peach[1]
  
    dx > 0 ? dx.times { print "LEFT\n" } : dx.abs.times { print "RIGHT\n" }
    dy > 0 ? dy.times { print "UP\n" } : dy.abs.times { print "DOWN\n" }
end

m = gets.to_i

grid = Array.new(m)

(0...m).each do |i|
  grid[i] = gets.strip
end

displayPathtoPrincess(m,grid)