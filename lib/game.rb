require_relative '../lib/ship'
require_relative '../lib/cell'
require_relative '../lib/board'
require 'pry'

class Game

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

Press Enter to Play
  "
  gets.chomp
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























end
