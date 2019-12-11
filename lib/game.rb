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
		@players = []
		@board_size = 0
		@ships = []
		prompt.aloha
		@board_size = prompt.board_size
		ships1 = prompt.ships
		ships2 = ships1.dup
		@ships << ships1
		@ships << ships2
		number_of_players = prompt.player_number
		true_index = 0
		number_of_players.first.each.with_index do |player, index|
			binding.pry
			@players << player = Player.new(player, @ships[index + true_index])
			true_index += 1
		end
		number_of_players.last.each do |computer|
			binding.pry
			@players << computer = Player.new(computer, @ships[true_index])
			true_index += 1
		end	
		@players.each do |player|
			binding.pry
			player.make_board
		end
	end
	
	def placements
		@players.each do |player|
			if player.computer? == true
				player.auto_place
			else
				while player.unplaced_ships != []
					binding.pry
					ship = prompt.what_ship(player.unplaced_ships)
					catch_bad_coordinates = 0
					while catch_bad_coordinates == 0
						coordinates = prompt.ship_location(ship)
						if player.board.valid_placement?(ship, coordinates) == true
							player.board.place(ship, coordinates)
							player.unplaced_ships.delete(ship)
							catch_bad_coordinates += 1
						else
							qprompt.invalid_ship_coordinates
						end
					end
				end
			end
		end
	end

						
						
		
		
		


	public
	def player_turns
		win = false
		winner = ""
		while win != true
			@players.each.with_index do |player, index|
				winner = player.name
				if player.computer? == true
					win = player.take_turn(@players[index - 1].board)
				else
					catch_bad_coordinate = 0
					while catch_bad_coordinate == 0
						prompt.board(player)
						prompt.enemy_board(@players[index - 1])
						coordinate = prompt.attack_location
						if (player.board.valid_coordinate?(coordinate)) && (!@players[index -1].board.cells[coordinate].fired_upon?)
							win = player.take_turn(@players[index - 1].board, coordinate)
							prompt.board(player)
							prompt.enemy_board(@players[index - 1])
							catch_bad_coordinate = 1
						else
							prompt.invalid_attack
						end
					end
				end
			end
		end
	prompt.win_message(winner)
	end

end
