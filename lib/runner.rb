require_relative 'ship.rb'
require_relative 'cell.rb'
require_relative 'board.rb'
require_relative 'player.rb'
require_relative 'prompt.rb'
require_relative 'game.rb'
require 'pry'


game = Game.new
endless = 0
while endless != 1
	game.setup
	game.placements
	game.player_turns
end

