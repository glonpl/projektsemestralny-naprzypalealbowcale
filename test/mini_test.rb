require "minitest/autorun"
require_relative "../lib/sudoku"

class TestMini < Minitest::Test

	def test_not_valid_name_of_file
		assert_raises(ArgumentError) {readFile("")}
	end
	
	def test_content_of_file
		expected_content = "530070000600195000098000060800060003400803001700020006060000280000419005000080079"
		data = readFile("plansza.txt")
		assert_equal(expected_content, data, "Dane się nie zgadzają")
	end
    
	def test_instance_of_object_after_loading_file_into_game
		sudoku = Sudoku.new(readFile("plansza.txt"))
		assert_instance_of(Sudoku, sudoku)
	end

	def test_last_row_of_board_after_loading_file_into_game
		expected_row = [0,0,0,0,8,0,0,7,9]
		sudoku = Sudoku.new(readFile("plansza.txt"))
		assert_equal(expected_row, sudoku.get_row(8), "Wiersze się nie zgadzają")
	end

end