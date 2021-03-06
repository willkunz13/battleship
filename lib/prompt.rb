class Prompt

	def aloha
		puts "Welcome to Battleship"
  puts "

                                       |__
                                       |\/
                                       ---
                                       / | [
                                !      | |||
                              _/|     _/|-++'
                          +  +--|    |--|--|_ |-
                       { /|__|  |/\__|  |--- |||__/
                      +---------------___[}-_===_.'____                 /\
                  ____`-' ||___-{]_| _[}-  |     |_[___\==--            \/   _
   __..._____--==/___]_|__|_____________________________[___\==--____,------'>
  |                                                                   BE-1911>
   \_________________________________________________________________________|

 Type play then press enter to begin, or type quit to exit
  "
  want_to_play = gets.chomp.downcase
    if want_to_play != "play".downcase
      exit
    end
	end
	def board_size
		16
	end

	def ships
		ship_list = []
		ship_list << @cruiser = Ship.new("Cruiser", 3)
		ship_list << @submarine = Ship.new("Submarine", 2)

		#add 2 different ships here
		ship_list
	end

	def ships2
		ship_list2 = []
		ship_list2 << @cruiser2 = Ship.new("Cruiser", 3)
		ship_list2 << @submarine2 = Ship.new("Submarine", 2)
		ship_list2
	end

	def player_number
        puts "Would you like to play single or multi player?"
        puts "1: Single Player (Versus Computer)"
        puts "2: Multi Player"
        catch = 0
        players = []
	human_players = []
        computers = []
        while catch == 0
		 answer = gets.chomp
            if answer.to_i == 1
                human_players << "player_1"
                computers << "computer"
                catch += 1
            elsif answer.to_i == 2
                human_players << "player_1"
                human_players << "player_2"
                catch += 1
            else
                puts "Invalid input: Need 1 or 2"
            end
        end

			if computers.count > 0
				  players << computers
					return players
			end
	# binding.pry
				return human_players
    end

	def attack_location
		puts "Enter the cell you would like to fire upon, then press enter (Example = A1)"
		puts "Remeber to only enter a cell that has already not been fired upon"
		attack_location = gets.chomp.upcase
		while attack_location.length != 2
			puts "Invalid shot, only enter a letter and number with no spaces"
			attack_location = gets.chomp.upcase
		end
		return attack_location
	end

	def ship_location(ship)
		puts "\n\n  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n"
		puts "\nEnter the coordinates where you would like your #{ship.name} to be"
		puts "Ships will be placed from left to right, or top to bottom"
		puts "Example: Cruiser fills 3 cells, valid locations could be"
		puts "A1 A2 A3, or A2 B2 C2"
		coordinates = []
		if ship.length == 2
			puts "Enter the first cell for the ship"
			coordinates << gets.chomp.upcase
			puts "Enter the second cell, the first cell was #{coordinates}"
			coordinates << gets.chomp.upcase
		end
		if ship.length == 3
			puts "Enter the first cell for the ship"
			coordinates << gets.chomp.upcase
			puts "Enter the second cell, the first cell was #{coordinates}"
			coordinates << gets.chomp.upcase
			puts "Enter the third cell, the first two cells are #{coordinates}"
			coordinates << gets.chomp.upcase
		end
		return coordinates
	end

	def what_ship(ships)
		puts "\n\n"
		puts "Your available ships are "
		ships.each.with_index(1) do |ship, index|
			puts "#{index}. #{ship.name} which takes up #{ship.length} spaces"
		end
			puts "What ship would you like to place first, enter 1 or 2"
			selected_ship = gets.chomp.to_i
			ships[selected_ship - 1]
	end

	def invalid_ship_coordinates
		"Invalid coordinates, please try again"
	end

def invalid_attack
	"That was an invlid shot, please try again"
end

	def win_message(player)
		puts "Conrgradulations #{player} you win"
		puts "Would you like to play again?"
		aloha
	end

	def board(player)
		puts "\n\n\n\n\n\n"
		puts "==========#{player.name}'s Board'=========="
		puts player.board.render(true)
	end

	def enemy_board(player)
		puts "=========Opponents Board========="
		puts player.board.render
	end
end
