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
		if @ship != nil
			@ship.health -= 1
		end
		@fired_upon = true

	end

	def render(ship_check = false)
		if ship_check == true && (!empty? &&(ship.sunk? == false))
			return "S"
		end

		if fired_upon? == true
			if @ship != nil
				if @ship.health == 0
					return "X"
				else
					return "H"
				end
			else
				return "M"
			end
		end
		return "."
	end
end
