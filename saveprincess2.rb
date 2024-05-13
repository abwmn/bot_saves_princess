#!/bin/ruby

def nextMove(n,r,c,grid)
  peach = find_peach(grid)
  direction = get_direction(peach, r, c)
  print direction
end

def find_peach(grid)
  grid.each_with_index do |chars, row|
      col = chars.index("p")
      return {:row => row, :col => col} if col
  end
end

def get_direction(peach, mario_row, mario_col)
  leftright = leftright(peach[:col], mario_col)
  leftright ? leftright : updown(peach[:row], mario_row)
end

def leftright(peach_col, mario_col)
  diff = mario_col - peach_col
  diff == 0 ? nil : (diff > 0 ? "LEFT" : "RIGHT")
end

def updown(peach_row, mario_row)
  diff = mario_row - peach_row
  diff > 0 ? "UP" : "DOWN"
end


n = gets.to_i

r,c = gets.strip.split.map {|num| num.to_i}

grid = Array.new(n)

(0...n).each do |i|
    grid[i] = gets
end

nextMove(n,r,c,grid)