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

	def take_turn(shot)
		if computer? == true
			random_cell = @board.cells.keys.sample
					while @board.cells[random_cell].fired_upon? == true
							random_cell = board.cells.keys.sample
					end
					shot = random_cell
		end
		@board.cells[shot].fire_upon
    @board.render
		win_check
	end

	def win_check
		 @board.render(true).each_char do |cell|
		       if cell == "S"
		          return false
		       end
		 end
		 return true
 	end

end
