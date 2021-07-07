require_relative 'cell.rb'
require 'pry'

class Board
	attr_reader :cells

	def initialize
		@rows = []
		@columns = []
		@cells = cell_create
	end

	def cell_create
		@rows = [*?A..?D]
		@columns = [*1..4].map { |n| n.to_s }
    		cells_array = []
                @rows.each do |row|
                       @columns.each do |column|
                                cells_array << row + column
                        end
                end
		create_hash_for_cells(cells_array)
	end

	def create_hash_for_cells(cells_array)#fix
		coordinate_names = []
		cells_array.each.with_index do |coordinate, index|
			coordinate_names << cells_array[index] = Cell.new(coordinate)
		end
		cell_mapping ={}
		coordinate_names.each.with_index do |cell, index|
			cell_mapping[coordinate_names[index].coordinate] = cell
		end
		return cell_mapping
	end

	def valid_coordinate?(check_coordinate)
		@cells.values.each do |cell|
			if cell.coordinate == check_coordinate
				return true
			end
		end
			return false
	end

	def valid_horizontal_generator(ship, coordinate)
		range_of_possible_rows = (coordinate[0].."Z").to_a
		valid_possible_horizontal_coordinates = range_of_possible_rows.slice(0,ship.length).map do |coordinate_column|
			coordinate_column + coordinate[1]
		end
		valid_possible_horizontal_coordinates.each do |coordinate|
			if cells.keys.include?(coordinate) == false
				return false
			else
			end
		end
		return valid_possible_horizontal_coordinates
	end

	def valid_vertical_generator(ship, coordinate)
		range_of_possible_columns = (coordinate[1].to_i..(coordinate[1].to_i + ship.length - 1)).to_a
		valid_possible_vertical_coordinates = range_of_possible_columns.map do |coordinate_row|
			coordinate[0] + coordinate_row.to_s
		end
		if valid_possible_vertical_coordinates - cells.keys == []
			return valid_possible_vertical_coordinates
		else
			return false
		end
	end

	def valid_placement?(ship, coordinates)
		coordinate = coordinates.first
		coordinates.each do |coordinate|
			if @cells.keys.include?(coordinate) == false
				return false
			end
		end
		if ship.length != coordinates.count
			return false			
		elsif overlap?(coordinates) == true
			return false
		
		elsif (coordinates == valid_horizontal_generator(ship, coordinate)) ||  (coordinates == valid_vertical_generator(ship, coordinate))
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
				return false
			else
				return true
			end
		end
	end

	def render(true_board = false)
		rendered_board = @cells.values.map do |cell|
			cell.render(true_board)
		end
		rendered_board_to_string(rendered_board_fill(rendered_board))
	end

	def rendered_board_fill(rendered_board)
		rows_duplicate = @rows.dup
		columns_duplicate = @columns.dup
		rendered_board = rendered_board.each_slice(columns_duplicate.count).to_a
		rows_duplicate.each.with_index do |row, index|
			rendered_board[index].unshift(row)
		end
		rendered_board.unshift(columns_duplicate.unshift(" "))
	end

	def rendered_board_to_string(rendered_board)
		rendered_board.map! do |array|
			array.join(" ")
		end
		rendered_board = rendered_board.join(" \n")
		rendered_board =rendered_board + " \n"
	end
end
