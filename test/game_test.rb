require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/ship'
require_relative '../lib/cell'
require_relative '../lib/board'
require_relative '../lib/game'
require 'pry'

class GameTest < Minitest::Test

  def setup
    @player1_board = Board.new
    @player2_board = Board.new
    @submarine = Ship.new("Submarine", 2)
    @cruiser = Ship.new("Cruiser", 3)
    @player1_board.place(@cruiser, ["A1", "A2", "A3"])
    @player1_board.place(@submarine, ["B1", "B2"])
    @player2_board.place(@submarine, ["B1", "B2"])
    @player2_board.place(@cruiser, ["A1", "A2", "A3"])
    @game = Game.new
  end

  def test_it_can_display_the_ascii_ship
    skip
    @game.welcome
    assert_includes "Welcome", @game.welcome
  end

  def test_computer_player_can_choose_a_shot
    @game.choose_shot(@player1_board)
    #binding.pry #string method include
    # assert_includes @player1_board.render, ("M" || "H")
    assert @player1_board.render.include? ("M" || "H")
  end

end
