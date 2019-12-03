require_relative '../lib/ship'
require_relative '../lib/cell'

class CellTest < Minitest::Test

	def setup
		cell = Cell.new("B4")
		cruiser = Ship.new("Cruiser", 3)
	end

	def test_class_cell_exists
		assert_instance_of Cell, cell
	end

	def test_cell_attributes
		assert_equal cell.coordinate, "B4"
		assert_equal cell.ship, nil
		assert_equal cell.empty?, true
	end
	
	def test_place_ship
		cell.place_ship(cruiser)
		assert(cell.ship)
		refute(cell.empty?)
	end
end


