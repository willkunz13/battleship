require_relative 'cell.rb'
require 'pry'

class Board
	attr_reader :cells

	def initialize
		@cells = cell_create
	end
	
	def cell_create
		rows = ['A', 'B', 'C', 'D']
                columns = [ '1', '2', '3', '4']
                board_array = []
                rows.each do |row|
                        columns.each do |column|
                                board_array << row + column
                        end
                end
		holder_array = []
		board_array.each.with_index do |coordinate, index|
			holder_array << board_array[index] = Cell.new(coordinate)	
		end
		hash ={}
		holder_array.each.with_index do |cell, index|
			hash[holder_array[index].coordinate] = cell
		end
		binding.pry
		return hash
	end
end



