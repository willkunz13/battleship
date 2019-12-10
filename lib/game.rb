require_relative '../lib/ship'
require_relative '../lib/cell'
require_relative '../lib/board'
require 'pry'

class Game
	attr_accessor :multiplayer, :prompt

	def initialize()
  		@players = []
		@prompt = Prompt.new
		@board_size = 0
		@ships = []
	end

	def setup
		prompt.aloha
		@board_size = prompt.board_size
		@ships = prompt.ships
		number_of_players = prompt.player_number
		number_of_players.first.each do |player|
			@players << player = Player.new(player, @ships)
		end
		number_of_players.last.each do |computer|
			@players << computer = Player.new(computer, @ships, true)
		end
		@players.each do |player|
			player.make_board
		end
	end
	
	def placements
		@players.each do |player|
			if player.computer? == true
				player.auto_place
			else
				while player.unplaced_ships != []
					ship = prompt.what_ship(player.unplaced_ships)
					catch_bad_coordinates = 0
					while catch_bad_coordinates == 0
						coordinates = prompt.ship_location(ship)
						if player.board.valid_placement?(ship, coordinates) == true
							player.board.place(ship, coordinates)
							player.unplaced_ships.delete(ship)
							catch_bad_coordinates += 1
						else
							prompt.invalid_ship_coordinates
						end
					end
				end
			end
		end
	end

						
						
		
		
		
	end

	def player_turns
		while win? != true
			player_1.take_turn(computer.board, prompt.attack_loaction)


end
