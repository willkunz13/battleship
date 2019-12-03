class Cell

	attr_reader :coordinate, :ship

	def initialize(coordinate)
		@coordinate = coordinate
		@ship = nil
		@fired_upon = false
	end

	def fired_upon?
		@fired_upon
	end

	def empty?
		@ship == nil
	end

	def place_ship(ship)
		@ship = ship
	end

	def fire_upon
		@fired_upon = true
		@ship.health -= 1
	end


end
