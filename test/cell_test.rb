require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require_relative '../lib/ship'
require_relative '../lib/cell'

class CellTest < Minitest::Test

	def setup
		@cell = Cell.new("B4")
		@cruiser = Ship.new("Cruiser", 3)
	end

	def test_class_cell_exists
		assert_instance_of Cell, @cell
	end

	def test_cell_attributes
		assert_equal @cell.coordinate, "B4"
		assert_equal @cell.ship, nil
		assert_equal @cell.empty?, true
	end
	
	def test_place_ship
		@cell.place_ship(@cruiser)
		assert(@cell.ship)
		refute(@cell.empty?)
	end

	def test_fired_upon?
		refute(@cell.fired_upon?)
	end

	def test_fire_upon
		@cell.place_ship(@cruiser)
		@cell.fire_upon
		assert_equal @cell.ship.health,2
		assert(@cell.fired_upon?)
	end
	
	def test_render
		assert_equal @cell.render, "."
		@cell.fire_upon
		assert_equal @cell.render, "M"
		cell_2 = Cell.new("A4")
		
		cell_2.place_ship(@cruiser)
		assert_equal cell_2.render(true), "S"
		cell_2.fire_upon
		assert_equal cell_2.render, "H"
		cell_2.fire_upon
		cell_2.fire_upon
		assert_equal cell_2.render, "X"
	end

end


