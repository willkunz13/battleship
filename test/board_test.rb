require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require_relative '../lib/ship'
require_relative '../lib/cell'
require_relative '../lib/board'

class BoardTest < Minitest::Test

	def setup
		@board = Board.new
		@cruiser = Ship.new("Cruiser", 3)
		@submarine = Ship.new("Submarine", 2)
	end

	def test_board_exists
		assert_instance_of Board, @board
	end

	def test_board_attributes
		assert_equal @board.cells.count, 16
	end

	def test_valid_coordinate?
		assert_equal @board.valid_coordinate?("A1"), true
		assert_equal @board.valid_coordinate?("D4"), true
		assert_equal @board.valid_coordinate?("A5"), false
		assert_equal @board.valid_coordinate?("E1"), false
		assert_equal @board.valid_coordinate?("A22"), false
	end

	def test_placement_is_valid
		assert_equal @board.valid_placement?(@cruiser, ["A1","A2"]), false
		assert_equal @board.valid_placement?(@submarine, ["A2", "A3", "A4"]), false
		assert_equal	@board.valid_placement?(@cruiser, ["A3", "A2", "A1"]) , false
		assert_equal	@board.valid_placement?(@cruiser, ["A1", "A2", "A4"]) , false
		assert_equal	@board.valid_placement?(@submarine, ["C1", "B1"]) , false
		assert_equal	@board.valid_placement?(@submarine, ["A1", "C1"]) , false

		assert_equal	@board.valid_placement?(@cruiser, ["A1", "B2", "C3"]) , false
		assert_equal	@board.valid_placement?(@cruiser, ["B1", "C1", "D1"]) , false
		assert_equal	@board.valid_placement?(@submarine, ["A1", "A2"]) , true
		assert_equal	@board.valid_placement?(@cruiser, ["B1", "C1", "D1"]) , true

	end

end
