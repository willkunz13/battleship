class Player

	attr_accessor :unplaced_ships, :board, :name

	def initialize(name, ships, computer = false)
		@unplaced_ships = ships
		@board = []
		@computer = computer
		@name = name
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
			true_test = false
			holder = nil
			while true_test != true
				random_cell = board.cells.keys.sample
				if orientation_option_generator(ship, random_cell) != false
						holder = random_cell
						true_test = true
				end
			end
			computer_placement_options = orientation_option_generator(ship, holder)
			board.place(ship, computer_placement_options.sample)
		end
		@unplaced_ships = []
	end
	def orientation_option_generator(ship, coordinate)
		if board.valid_coordinate?(coordinate) == false
			return false
		end
		possible_directions = []
		if board.valid_horizontal_generator(ship, coordinate) != false
			possible_directions << board.valid_horizontal_generator(ship, coordinate)
		end
		if board.valid_vertical_generator(ship, coordinate) != false
			binding.pry
			possible_directions << board.valid_vertical_generator(ship, coordinate)
		end
		if possible_directions == []
			return false
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
			return win_check(enemy_board)
		else
			enemy_board.cells[shot].fire_upon
    			# enemy_board.render
			if enemy_board.cells[shot].empty? == false
				puts "\nYour shot on #{shot} was a hit"
			else
				puts "\nYour shot on #{shot} was a miss"
			end
			win_check(enemy_board)
		end
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
