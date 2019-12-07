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
    assert_instance_of Play_phase, @p1_turn
  end

  def test_shot_can_be_placed_on_board
      refute(@player2_board.cells["A1"].fired_upon?)
      @p1_turn.place_shot
      assert(@player2_board.cells["A1"].fired_upon?)
      assert_includes @player2_board.render, "A H . . ."
      refute @p1_turn.win_check
  end

  def test_check_for_win_after_shot_is_placed
    player1_turn = Play_phase.new(@player2_board, "A1")
    player1_turn.place_shot
    player1_turn = Play_phase.new(@player2_board, "A2")
    player1_turn.place_shot
    player1_turn = Play_phase.new(@player2_board, "A3")
    player1_turn.place_shot
    player1_turn = Play_phase.new(@player2_board, "B1")
    player1_turn.place_shot
    player1_turn = Play_phase.new(@player2_board, "B2")
    player1_turn.place_shot
    assert_includes @player2_board.render, "A X X X ."
    assert_includes @player2_board.render, "B X X . ."
    assert player1_turn.win_check
  end
end
