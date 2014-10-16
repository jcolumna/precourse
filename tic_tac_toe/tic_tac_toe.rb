#tic_tac_toe.rb

# 1. Come up with requirements/specifications, which will determine the scope.
# 2. Application Logic; sequence of steps
# 3. Translation of steps into code
# 4. Run code to verify Logic


# draw a board

# assign player to "X"
# assign computer to "O"

# loop until a winner or all squares are taken
#   player  picks an empty square
#   check for a winner
#   computer picks an empty square
#   check for a winner

# if there's a winner
#   show the winner
# or else
#   it's a tie

require 'pry'

def initialize_board
  b = {}
  (1..9).each { |position| b[position] = ' ' }
  b
end

def draw_board(b)
  system 'clear'
  puts " #{b[1]} | #{b[2]} | #{b[3]} "
  puts " - + - + -"
  puts " #{b[4]} | #{b[5]} | #{b[6]} "
  puts " - + - + -"
  puts " #{b[7]} | #{b[8]} | #{b[9]}"
end

# def empty_squares(b) ====> My original attempt
#   empty = []
#   i = 1
#   b.values.each do |val| 
#     if val == ' '
#       empty << i
#     end
#     i += 1
#   end
#   empty
# end

def empty_positions(b)
  b.select { |k, v| v == ' ' }.keys
end


def player_picks_square(b)
  valid = false 
  begin
  puts "Pick a square. (1 - 9):"
  position = gets.chomp.to_i
    if empty_positions(b).include?(position) && (1..9).include?(position)
      b[position] = "X"
      valid = true
    end 
  end until valid
end

def computer_picks_square(b)
  b[empty_positions(b).sample] = 'O'
end

def win_test(b, winner)
  winning_lines = [ [1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7] ]
  winning_lines.each do |line|
    if b[line[0]] == "X" && b[line[1]] == "X" && b[line[2]] == "X"
      winner = 'player'
    elsif b[line[0]] == "O" && b[line[1]] == "O" && b[line[2]] == "O"
      winner = 'computer'
    end
  end
  winner
end


begin
  game_over = true
  winner = nil
  
  board = initialize_board
  draw_board(board)
  
  begin
    player_picks_square(board)
    winner = win_test(board, winner)
    
    if winner   
      draw_board(board)
      break 
      #Needed to do a test here in case player and computer both had 
      #a winning line in one iteration through the while loop.
    end
    
    computer_picks_square(board)
    winner = win_test(board, winner)
    draw_board(board)
  end until winner || empty_positions(board).empty?

  if winner
    puts "Winner is #{winner}!"
    sleep(1)
    puts ''
    puts "Play again? (Y, N)"
    input = gets.chomp
    if input.casecmp('y') == 0
      game_over = false
    end  
  else 
    puts "Cat's Game~~ No winners this time.."
    sleep(1)
    puts ''
    puts "Play again? (Y, N)"
    input = gets.chomp
    if input.casecmp('y') == 0
      game_over = false
    end
  end
end until game_over