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

	def test_valid_placement_lenght
		assert_equal @board.valid_placement?(@cruiser, ["A1","A2"]), false
		assert_equal @board.valid_placement?(@submarine, ["A2", "A3", "A4"]), false

	end

	def test_valid_placement_consecutive
		assert_equal	@board.valid_placement?(@cruiser, ["A3", "A2", "A1"]) , false
		assert_equal	@board.valid_placement?(@cruiser, ["A1", "A2", "A4"]) , false
		assert_equal	@board.valid_placement?(@submarine, ["C1", "B1"]) , false
		assert_equal	@board.valid_placement?(@submarine, ["A1", "C1"]) , false
	end

	def test_valid_placement_diagonal
		assert_equal	@board.valid_placement?(@cruiser, ["A1", "B2", "C3"]) , false
		assert_equal	@board.valid_placement?(@submarine, ["C2", "D3"]) , false
	end

	def test_valid_placement_true
		assert_equal	@board.valid_placement?(@submarine, ["A1", "A2"]) , true
		assert_equal	@board.valid_placement?(@cruiser, ["B1", "C1", "D1"]) , true
	end

	def test_ships_can_be_placed
		@cell_1 = @board.cells["A1"]
		@cell_2 = @board.cells["A2"]
		@cell_3 = @board.cells["A3"]
		@board.place(@cruiser, ["A1", "A2", "A3"])
		assert_equal @cell_1.ship, @cruiser
	end

	def test_ships_cant_overlap
		@board.place(@cruiser, ["A1", "A2", "A3"])
		refute @board.valid_placement?(@submarine, ["A1", "B1"])
	end

	def test_board_can_render
		@board.place(@cruiser, ["A1", "A2", "A3"])
		assert_includes @board.render, "  1 2 3 4"
		assert_includes @board.render, "A . . . "
		assert_includes @board.render, "B . . . "
		assert_includes @board.render, "C . . . "
		assert_includes @board.render, "D . . ."
	end

	def test_board_can_render_and_show_ships
		@board.place(@cruiser, ["A1", "A2", "A3"])
		assert_includes @board.render(true), "  1 2 3 4"
		assert_includes @board.render(true), "A S S S "
		assert_includes @board.render(true), "B . . . ."
		assert_includes @board.render(true), "C . . . ."
		assert_includes @board.render(true), "D . . . ."
	end

	def test_board_can_render_hits_and_misses
		@board.place(@cruiser, ["A1", "A2", "A3"])
		@board.cells["A1"].fire_upon
		@board.cells["B1"].fire_upon
		assert_includes @board.render, "  1 2 3 4"
		assert_includes @board.render, "A H . . ."
		assert_includes @board.render, "B M . . ."
		assert_includes @board.render, "C . . . ."
		assert_includes @board.render, "D . . . ."
	end

	def test_board_can_render_sunk_ships
		@board.place(@cruiser, ["A1", "A2", "A3"])
		@board.cells["A1"].fire_upon
		@board.cells["A2"].fire_upon
		@board.cells["A3"].fire_upon
		assert_includes @board.render, "  1 2 3 4"
		assert_includes @board.render(true), "A X X X ."
		assert_includes @board.render, "B . . . ."
		assert_includes @board.render, "C . . . ."
		assert_includes @board.render, "D . . . ."
	end
end
