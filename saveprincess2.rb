#!/bin/ruby

def nextMove(n,r,c,grid)
  print get_direction(mario_row: r, mario_col: c, **peach_position(grid))
end

def peach_position(grid)
  grid.each_with_index do |chars, row|
      col = chars.index("p")
      return {:peach_row => row, :peach_col => col} if col
  end
end

def get_direction(peach_row:, peach_col:, mario_row:, mario_col:)
  peach_col == mario_col ? row_move(peach_row, mario_row) : col_move(peach_col, mario_col)
end

def col_move(peach_col, mario_col)
  mario_col - peach_col > 0 ? "LEFT" : "RIGHT"
end

def row_move(peach_row, mario_row)
  mario_row - peach_row > 0 ? "UP" : "DOWN"
end


n = gets.to_i
r,c = gets.strip.split.map {|num| num.to_i}

grid = Array.new(n)

(0...n).each do |i|
    grid[i] = gets
end

nextMove(n,r,c,grid)