require_relative 'cell.rb'
require 'pry'

class Board
	attr_reader :cells

	def initialize
		@rows = [*?A..?D] #["A","B","C","D"]
		@columns = [*1..4].map { |n| n.to_s }
		@cells = cell_create
	end

	def cell_create

		rows = @rows
                columns = @columns
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
		return hash
	end

	def valid_coordinate?(check_coordinate)
		@cells.values.each do |cell|
			if cell.coordinate == check_coordinate
				return true
			end
		end
			return false
	end

	def valid_placement?(ship, coordinates)
		if ship.length != coordinates.count
			return false
		end
		first = coordinates.first
		row = first[0]
		col = first[1]
		return true
	end


end
