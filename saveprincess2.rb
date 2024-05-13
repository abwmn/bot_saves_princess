#!/bin/ruby

def nextMove(n,r,c,grid)
  peach_col, peach_row = nil, nil
    
  grid.each_with_index do |row, y|
      x = row.index("p")
      if x
          peach_col, peach_row = x, y
          break
      end
  end
    
  dx, dy = c - peach_col, r - peach_row
    
  if dx > 0
      print "LEFT"
  elsif dx < 0 
      print "RIGHT"
  elsif dy > 0
      print "UP"
  elsif dy < 0
      print "DOWN"
  else
      print "PRINCESS PEACH, IT'S A ME, MARIO!!"
  end
end

n = gets.to_i

r,c = gets.strip.split.map {|num| num.to_i}

grid = Array.new(n)

(0...n).each do |i|
    grid[i] = gets
end

nextMove(n,r,c,grid)