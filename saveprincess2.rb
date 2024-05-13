#!/bin/ruby

def nextMove(n,r,c,grid)
  peach_coordinates = find_peach(grid)
  print get_direction(mario_row: r, mario_col: c, **peach_coordinates)
end

def find_peach(grid)
  grid.each_with_index do |chars, row|
      col = chars.index("p")
      return {:peach_row => row, :peach_col => col} if col
  end
end

def get_direction(peach_row:, peach_col:, mario_row:, mario_col:)
  leftright = leftright(peach_col, mario_col)
  leftright ? leftright : updown(peach_row, mario_row)
end

def leftright(peach_col, mario_col)
  diff = mario_col - peach_col
  diff > 0 ? "LEFT" : ( diff < 0 ? "RIGHT" : nil )
end

def updown(peach_row, mario_row)
  mario_row - peach_row > 0 ? "UP" : "DOWN"
end


n = gets.to_i

r,c = gets.strip.split.map {|num| num.to_i}

grid = Array.new(n)

(0...n).each do |i|
    grid[i] = gets
end

nextMove(n,r,c,grid)