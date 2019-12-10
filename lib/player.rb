class Player
	
	attr_reader :board 
	attr_accessor :unplaced_ships

	def initialize(ships, computer = false)
		@unplaced_ships = ships
		@board = []
		@computer = computer
	end

	def computer?
		@computer
	end
				
	def make_board
		@board = Board.new
		
	end

	def unplaced_ship_names
		@unplaced_ships.map do |ship|
			ship.name
		end
	end

	def orientation_option_generator(ship, coordinate)
		if board.valid_coordinate?(coordinate) == false
			return "Not a valid coordinate"
		end	
		possible_directions = {}
		if board.valid_horizontal_generator(ship, coordinate) != false
			possible_directions["Right"] = board.valid_horizontal_generator(ship, coordinate)
		end
		if board.valid_vertical_generator(ship, coordinate) != false
			possible_directions["Down"] = board.valid_vertical_generator(ship, coordinate)
		end
		if possible_directions == {}
			return "Not possible to place that ship here"
		end
		return possible_directions		
	end
		
end
