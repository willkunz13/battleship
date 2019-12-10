require_relative '../lib/ship'
require_relative '../lib/cell'
require_relative '../lib/board'
require 'pry'

class Game
attr_accessor :multiplayer
def initialize()
  @multiplayer = false
end

def welcome
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
   __..._____--==/___]_|__|_____________________________[___\==--____,------' .7
  |                                                                   BE-1911 /
   \_________________________________________________________________________|

 Type play then press enter to begin, or type quit to exit
  "
  want_to_play = gets.chomp.downcase
    if want_to_play != "play".downcase
      exit
    end
end

  def choose_shot(board)
  #This is where we will pass in the board the
  #cpu is guessing on, and pick its next guess
  #this will
  #probably iteratin through the hash, finding a cell
  #that has not been fired upon
  random_cell = board.cells.keys.sample
      while board.cells[random_cell].fired_upon? == true
          random_cell = board.cells.keys.sample
      end
    # binding.pry
   #this places the random cell shot on the board
    board.cells[random_cell].fire_upon
    # board.render
  end

def player_choice
  puts " How many people are playing, please enter 1 or 2"
  players = gets.chomp
  if players = (2 || "two")
    @multiplayer = true
  end
end


end
