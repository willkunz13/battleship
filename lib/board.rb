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
		if overlap?(coordinates) == false
			return false
		end

		first = coordinates.first
		row = first[0]
		col = first[1].to_i
		row_array = (row.."Z").to_a
		final_row_array = row_array.slice(0,ship.length)
		final_row_array.map! do |element|
			element + col.to_s
		end
		col_array = (col..(col + ship.length - 1)).to_a
		final_col_array = col_array.map do |element|
			row + element.to_s
		end
		if coordinates == final_col_array || coordinates == final_row_array
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
		# binding.pry
		rows_temp = @rows.dup
		columns_temp = @columns.dup
		# rendered_board = nil
		rendered_board = @cells.values.map do |cell|
			cell.render(true_board)
		end
		rendered_board = rendered_board.each_slice(columns_temp.count).to_a
		rows_temp.each.with_index do |row, index|
			# binding.pry
			rendered_board[index].unshift(row)
		end
		rendered_board.unshift(columns_temp.unshift("  "))
		rendered_board.map! do |array|
			array.join(" ")
		end
		rendered_board = rendered_board.join(" \n")
		rendered_board[0] = ''
		rendered_board =rendered_board + " \n"
		# binding.pry
		return rendered_board
	end
end
