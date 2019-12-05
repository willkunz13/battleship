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

	def valid_horizontal_generator(ship, coordinates)
		range_of_possible_rows = (coordinates.first[0].."Z").to_a
		valid_possible_horizontal_coordinates = range_of_possible_rows.slice(0,ship.length).map! do |coordinate_column|
			coordinate_column + coordinates.first[1]
		end
		return valid_possible_horizontal_coordinates
	end
	
	def valid_vertical_generator(ship, coordinates)
		range_of_possible_columns = (coordinates.first[1].to_i..(starter_column + ship.length - 1)).to_a
		valid_possible_vertical_coordinates = range_of_possible_columns.map do |coordinate_row|
			starter_row + coordinate_row.to_s
		end
		return valid_possible_vertical_coordinates	
	end
	def valid_placement?(ship, coordinates)
		binding.pry
		if ship.length != coordinates.count
			return false
		end
		if overlap?(coordinates) == false
			return false
		end

		if coordinates == valid_horizontal_generator(ship, coordinates) || coordinates == valid_horizontal_generator(ship, coordinates)
			binding.pry
			return true
		else
			return false
		end
	end

	def place(ship, coordinates)
		coordinates.each do |coordinate|
			@cells[coordinate].place_ship(ship)
		end
	end

	def overlap?(coordinates)
		coordinates.each do |coordinate|
			if @cells[coordinate].empty? == true
			else
				return false
			end
		end
		return true
	end

	def render(true_board = false)
		rendered_board = @cells.values.map do |cell|
			cell.render(true_board)
		end
		rows_duplicate = @rows.dup
		columns_duplicate = @columns.dup
		rendered_board = rendered_board.each_slice(columns_duplicate.count).to_a
		rows_duplicate.each.with_index do |row, index|
			rendered_board[index].unshift(row)
		end
		rendered_board.unshift(columns_duplicate.unshift("  "))
		rendered_board.map! do |array|
			array.join(" ")
		end
		rendered_board = rendered_board.join(" \n")
		rendered_board[0] = ''
		rendered_board =rendered_board + " \n"
	end	
end
