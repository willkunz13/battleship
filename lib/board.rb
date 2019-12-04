require_relative 'cell.rb'
require 'pry'

class Board
	attr_reader :cells

	def initialize
		@rows = [*?A..?D] 
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
		col = first[1].to_i
		row_array = (row.."Z").to_a
		final_row_array = row_array.slice!(0,ship.length)
		final_row_array.map! do |element|
			element + col.to_s
		end
		
		binding.pry
		return true
	end


end
