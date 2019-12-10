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

	def board_size
		16
	end

	def ships
		ships << @cruiser = Ship.new("Cruiser", 3)
		ships << @submarine = Ship.new("Submarine", 2)
		ships
	end

	def player_number
		puts "Would you like to play single or multi player?"
		puts "1: Single Player (Versus Computer)"
		puts "2: Multi Player"
		answer = gets.chomp
		catch = 0
		players = []
		while catch == 0
			if answer.to_i == 1
				players << player_1
				players << computer
				catch += 1
			elsif answer.to_i == 2
				players << player_1
				players << player_2
				catch += 1
			else
				puts "Invalid input: Need 1 or 2"
			end
		end
		return players
		
	end		
end

