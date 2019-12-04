require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require_relative '../lib/ship'
require_relative '../lib/cell'
require_relative '../lib/board'

class BoardTest < Minitest::Test

	def setup
		@board = Board.new
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

end
	


