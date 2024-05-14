require_relative 'movable'
require_relative 'renderable'

class Board
  include Movable
  include Renderable

  attr_reader :size, :grid, :mode, :moves, :peach, :mario 
  
  def initialize
    @grid = Array.new(@size) { "-" * @size }
    @moves = []
    place_chars
  end
end