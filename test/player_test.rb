require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require_relative '../lib/ship'
require_relative '../lib/cell'
require_relative '../lib/board'
require_relative '../lib/player'

class PlayerTest < Minitest::Test

	def setup
		@cruiser = Ship.new("Cruiser", 3)
		@submarine = Ship.new("Submarine", 2)
		@player_1 = Player.new([@cruiser, @submarine])
		@computer = Player.new([@cruiser, @submarine], true)
	end

	def test_placement_phase_exists
		assert_instance_of Player, @player_1
	end

	def test_placement_phase_attributes
		assert_equal @cruiser, @player_1.unplaced_ships[0]
		assert_equal @submarine, @player_1.unplaced_ships[1]
	end

	def test_make_board
		assert_equal [],@player_1.board
		@player_1.make_board
		assert_instance_of Board, @player_1.board
	end

	def test_unplaced_ship_names
		assert_includes @player_1.unplaced_ship_names, @cruiser.name
		assert_includes @player_1.unplaced_ship_names,@cruiser.name
	end

	def test_orientation_option_generator
		skip
		coordinate = "A1"
		@player_1.make_board
		assert_includes @player_1.orientation_option_generator(@cruiser, coordinate).values, ["A1", "A2", "A3"]
		coordinate = "D4"
		assert_equal @player_1.orientation_option_generator(@cruiser, coordinate), "Not possible to place that ship here"

	end

	def test_take_turn
		@player_1.make_board
		@computer.make_board
		@computer.board.place(@cruiser, ["A1", "A2", "A3"])
    @player_1.take_turn(@computer.board, "A1")
		# @computer.take_turn

    assert_includes @computer.board.render, "A H . . ."
    refute @player_1.win_check(@computer.board)
  end

	def test_computer_can_autoplace
		@player_1.make_board
		@computer.make_board
		# binding.pry
		@computer.auto_place
		assert_includes @computer.board.render(true), "S"
		#binding.pry
	end
end
