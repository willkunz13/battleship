require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require_relative '../lib/ship'
require_relative '../lib/cell'
require_relative '../lib/board'

class BoardTest < Minitest::Test

	def setup
		rows = ['A', 'B', 'C', 'D']
		columns = [ '1', '2', '3', '4']
		board_array = []
		rows.each do |row|
			columns.each do |column|
				board_array = row + column
			end
		end
		binding.pry
	end
end


