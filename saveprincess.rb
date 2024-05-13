#!/bin/ruby

def displayPathtoPrincess(n,grid)
    peach_coordinates, mario_coordinates = nil, nil
  
    grid.each_with_index do |row, y|
        row.each_char.with_index do |char, x|
            next if char == "-"
            if char == "p"
                peach_coordinates = [x, y] 
            elsif char == "m"
                mario_coordinates = [x, y]
            end
            break if peach_coordinates && mario_coordinates
        end
    end
  
    xdiff = mario_coordinates[0] - peach_coordinates[0]
    ydiff = mario_coordinates[1] - peach_coordinates[1]
  
    xdiff > 0 ? xdiff.times { print "LEFT\n" } : xdiff.abs.times { print "RIGHT\n" }
    ydiff > 0 ? ydiff.times { print "UP\n" } : ydiff.abs.times { print "DOWN\n" }
end

m = gets.to_i

grid = Array.new(m)

(0...m).each do |i|
  grid[i] = gets.strip
end

displayPathtoPrincess(m,grid)