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

	def render(truth = false)
		if truth == true 
			if empty?
				if fired_upon?
					return "M"
				else
					return "."
				end
			elsif @ship.health == 0
				return "X"
			elsif fired_upon?
				return "H"
			else
				return "S"
			end
		elsif fired_upon?
			if empty?
				return "M"
			elsif @ship.health == 0
				return "X"
			else
				return "H"
			end 
		else
			return "."

		end	
	end
end
