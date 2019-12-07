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
    @board.cells[shot].fire_upon
  end

  def win_check
    #use find enumerable to search true board for boat
    #if B is found return false, else true
  end
end
