require_relative './sudoku'

puts "Let's start the game!"
puts " Please enter the name file with Sudoku table (default: plansza.txt)"


#tu otworz plik o podanej nazwie


  user_input = gets.chomp
  string_input = user_input.to_s
  game = Sudoku.new(string_input)


puts "Let's fill out a sudoku table with your original inputs: "
  # Here goes the code for printing the board without solving it
  p game.board

puts "Are you ready to see how I help you to solve your Sudoku game?, enter 'Y' for yes and 'N'for no "
  user_decision = gets.chomp
  if user_decision.upcase == "Y"
    game.sudoku_solve!
  elsif user_decision.upcase == "N"
    puts "Goodbye!"
  else
    "I dont understand what you are saying"
  end

puts "I hope I was helpful =)"
