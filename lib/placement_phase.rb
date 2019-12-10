class Placement_phase

	attr_reader :player_1_unplaced_ships, :player_2_unplaced_ships, :player_1_board, :player_2_board
	
	def initialize(ships)
		@player_1_unplaced_ships = ships
		@player_2_unplaced_ships = ships.dup
		@player_1_board = []
		@player_2_board = []
		@horizontal = []
		@vertical = []
	end

	def make_player_1_board
		player_1_board = Board.new
		@player_1_board = player_1_board
	end

	def make_player_2_board
		player_2_board = Board.new
		@player_2_board = player_2_board
	end

	def direction_generator(coordinate)
		
	def player_one_place
		while @player_1_unplaced_ships != []
			puts "What ship would you like to place?"
			@player_1_unplaced_ships.each.with_index do |ship, index|
				puts "#{index}. #{ship}"
			end
			p "Desired ship number?"
			ship_number = gets.chomp
			puts "Is #{@player_1_unplaced_ships[ship_number]} the ship you want to place?\n\
y = Yes, n = No"
			yes_or_no = gets.chomp
			if yes_or_no == "n"
				@player_1_unplaced_ships
			if yes_or_no == "y"
				puts "What coordinate would you like to place it at?\n]\
Remember it must be a valid coordinate, and you will be placing it #{player_1_unplaced_ships[ship_number].length} spaces\
either to the right or down."
			
			coordinate = gets.chomp
			direction_generator(coordinate).each.with_index do |option, index|
			
					
	end	
		

end
