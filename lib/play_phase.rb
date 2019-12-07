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
    @board.render
    win_check
  end

  def win_check
      @board.render(true).each_char do |cell|
        if cell == "S"
          return false
        end
      end
  end
end
