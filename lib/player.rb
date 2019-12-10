class Player

	attr_accessor :unplaced_ships, :board

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

	def auto_place
			@unplaced_ships.each do |ship|
				while orientation_option_generator(ship, random_cell = board.cells.keys.sample) == false
					random_cell = board.cells.keys.sample
				end
					computer_placement_options = orientation_option_generator(ship, random_cell = board.cells.keys.sample)
					board.place(ship, computer_placement_options.sample)
			end
			@unplaced_ships = []
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

	def take_turn(enemy_board, shot = "A1")
		if computer? == true
			random_cell = enemy_board.cells.keys.sample
					while enemy_board.cells[random_cell].fired_upon? == true
							random_cell = enemy_board.cells.keys.sample
					end
					shot = random_cell
		end
		enemy_board.cells[shot].fire_upon
    enemy_board.render
		win_check(enemy_board)
	end

	def win_check(enemy_board)
		 enemy_board.render(true).each_char do |cell|
		       if cell == "S"
		          return false
		       end
		 end
		 return true
 	end

end
