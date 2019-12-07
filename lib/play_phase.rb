require_relative '../lib/ship'
require_relative '../lib/cell'
require_relative '../lib/board'
require 'pry'

class Play_phase

  attr_reader :board, :shot

  def initialize(board, shot)
    @board = board
    @shot = shot
  end

  def place_shot
    @board.cells[shot].fireupon
  end
end
