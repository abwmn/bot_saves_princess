#!/bin/ruby

def nextMove(n,r,c,grid)
  peach = find_peach(grid)
  direction = pick_direction(peach, r, c)
  print direction
end

def find_peach(grid)
  grid.each_with_index do |row, y|
      x = row.index("p")
      return [x, y] if x
  end
end

def pick_direction(peach, r, c)
  dx = c - peach[0]
  
  if dx > 0
    return "LEFT"
  elsif dx < 0 
    return "RIGHT"
  end

  dy = r - peach[1]

  if dy > 0
    "UP"
  elsif dy < 0
    "DOWN"
  else
    "PRINCESS PEACH, IT'S A ME, MARIO!!"
  end
end

n = gets.to_i

r,c = gets.strip.split.map {|num| num.to_i}

grid = Array.new(n)

(0...n).each do |i|
    grid[i] = gets
end

nextMove(n,r,c,grid)