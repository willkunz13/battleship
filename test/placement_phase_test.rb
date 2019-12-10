require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require_relative '../lib/ship'
require_relative '../lib/cell'
require_relative '../lib/board'
require_relative '../lib/placement_phase'

class Placement_phaseTest < Minitest::Test

	def setup
		@cruiser = Ship.new("Cruiser", 3)
		@submarine = Ship.new("Submarine", 2)
		@p_phase = Placement_phase.new([@cruiser, @submarine])
	end

	def test_placement_phase_exists
		assert_instance_of Placement_phase, @p_phase
	end

	def test_placement_phase_attributes
		#binding.pry
		assert_equal @cruiser, @p_phase.player_1_unplaced_ships[0]
		assert_equal @submarine, @p_phase.player_2_unplaced_ships[1]
	end

	def test_make_board
		assert_equal [],@p_phase.player_2_board
		@p_phase.make_player_1_board
		@p_phase.make_player_2_board
		assert_instance_of Board, @p_phase.player_2_board
		assert_instance_of Board, @p_phase.player_1_board
		binding.pry
	end

	def test place_ship
		binding.py
		assert_include? @p_phase.player_2_board.cells.empty?, false
	
	end
end
