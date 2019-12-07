require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require_relative '../lib/play_phase'

class Play_PhaseTest < Minitest::Test

  def setup
    @player1_board = Board.new
    @player2_board = Board.new
    @submarine = Ship.new("Submarine", 2)
    @cruiser = Ship.new("Cruiser", 3)
    @player1_board.place(@cruiser, ["A1", "A2", "A3"])
    @player1_board.place(@submarine, ["B1", "B2"])
    @player2_board.place(@submarine, ["B1", "B2"])
    @player2_board.place(@cruiser, ["A1", "A2", "A3"])
    @p1_turn = Play_phase.new(@player2_board, "A1")

  end

  def test_play_phase_exists
    # binding.pry
    assert_instance_of Play_phase, @p1_turn
  end

  def test_shot_can_be_placed_on_board
      skip
  #create test that passes if board has no ships left
  end
end
