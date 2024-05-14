require_relative 'movable'
require_relative 'renderable'

class Board
  include Movable
  include Renderable

  attr_reader :size, :grid, :mode, :moves, :peach, :mario 
  
  def initialize
    make_grid
  end
end