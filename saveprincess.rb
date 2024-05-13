#!/bin/ruby

def displayPathtoPrincess(n,grid)
    corners = [grid[0][0], grid[0][-1], grid[-1][0], grid[-1][-1]]
    peach_corner = corners.find_index("p")
    xmove, ymove = case peach_corner
        when 0
            ["LEFT\n", "UP\n"]
        when 1
            ["RIGHT\n", "UP\n"]
        when 2 
            ["LEFT\n", "DOWN\n"]
        when 3
            ["RIGHT\n", "DOWN\n"]
    end
    
    (n/2).times { print xmove + ymove }
end

m = gets.to_i

grid = Array.new(m)

(0...m).each do |i|
  grid[i] = gets.strip
end

displayPathtoPrincess(m,grid)