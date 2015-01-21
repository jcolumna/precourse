# oop_tic_tac_toe.rb

# @author - Joshua Columna
# @date   - 1/20/2015

# In tic tac toe, you and your opponent take turns placing
# your symbol into a 3x3 grid. To win you must secure 
# three squares in a row with your symbol (either X's or O's.)

require 'pry'

class Player
  
  attr_accessor :choice

  def pick_square(b_obj) #Accepts an object of class Board
  valid = false 
    begin
    puts "Pick a square. (1 - 9):"
    position = gets.chomp.to_i
      if b_obj.empty_positions.include?(position) && (1..9).include?(position)
        b_obj.board[position] = "X"
        valid = true
      end 
    end until valid
    position
  end
end

class Computer

  attr_accessor :choice
  
  def pick_square(b_obj) #Accepts an object of class Board
    choice = b_obj.empty_positions.sample
    b_obj.board[choice] = 'O'
    choice 
  end

  #If two of any winning line are filled with the same symbol
  #and the third is empty, pick that square.
  def ai_pick_square(b_obj) #Accepts an object of class Board
    winning_lines = [ [1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7] ]
    choice = false
    winning_lines.each do |line|
      #Grab the values stored in the board at each of the winning line locations.
      #Test to see if ... two are equal and the third, empty.
      tester = []
      if !(b_obj.board[line[0]] == " ") && !(b_obj.board[line[1]] == " ") && b_obj.board[line[2]] == " "
        tester << b_obj.board[line[0]]
        tester << b_obj.board[line[1]]
        if tester.first == tester.last
          choice = line[2]
        end
      elsif !(b_obj.board[line[0]] == " ") && b_obj.board[line[1]] == " " && !(b_obj.board[line[2]] == " ")
        tester << b_obj.board[line[0]]
        tester << b_obj.board[line[2]]
        if tester.first == tester.last
          choice = line[1]
        end
      elsif b_obj.board[line[0]] == " " && !(b_obj.board[line[1]] == " ") && !(b_obj.board[line[2]] == " ")
        tester << b_obj.board[line[1]]
        tester << b_obj.board[line[2]]
        if tester.first == tester.last
          choice = line[0]
        end
      end
      break if choice
    end

    if choice #if there's a block or a win to be made
      b_obj.board[choice] = 'O'
    else #choose randomly
      choice = b_obj.empty_positions.sample
      b_obj.board[choice] = 'O'
    end
      choice 
  end
end
  


class Board
  
  attr_accessor :board
  
  def initialize()
    @board = {}
    (1..9).each{ |position| self.board[position] = ' ' } 
    # b == {1=>" ", 2=>" ", 3=>" ", 4=>" ", 5=>" ", 6=>" ", 7=>" ", 8=>" ", 9=>" "}
  end

  def draw
  system 'clear'
  puts " #{self.board[1]} | #{self.board[2]} | #{self.board[3]} "
  puts " - + - + -"
  puts " #{self.board[4]} | #{self.board[5]} | #{self.board[6]} "
  puts " - + - + -"
  puts " #{self.board[7]} | #{self.board[8]} | #{self.board[9]}"
  end

  def empty_positions
  self.board.select { |k, v| v == ' ' }.keys
  end

  def win_test
    winner = false
    winning_lines = [ [1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7] ]
    winning_lines.each do |line|
      if self.board[line[0]] == "X" && self.board[line[1]] == "X" && self.board[line[2]] == "X"
        winner = 'Player'
      elsif self.board[line[0]] == "O" && self.board[line[1]] == "O" && self.board[line[2]] == "O"
        winner = 'Computer'
      end
    end
    winner
  end

  def play_again
    puts "Play again? (y/n)"
    input = gets.chomp.downcase
    if input == "y"
      tic_tac = Tic_tac_toe.new.run
    else
      sleep(1)
      puts "Thanks for playing! :D"
    end
  end

end

class Tic_tac_toe

  def run
    p1 = Player.new
    b1 = Board.new
    c1 = Computer.new
    winner_found = false
    while !winner_found && !b1.empty_positions.empty?
     
      b1.draw
      p1.choice = p1.pick_square(b1)
      b1.draw
      puts "You chose square \##{p1.choice}."
      sleep(2)
      winner_found = b1.win_test
      break if winner_found
      break if b1.empty_positions.empty?
      c1.choice = c1.ai_pick_square(b1)
      b1.draw
      puts "The computer chose square \##{c1.choice}."
      sleep (1)
      winner_found = b1.win_test

    end

    if winner_found
      puts "#{winner_found} wins!"
    else
      puts "Cat's game... No winner this time~~"
    end

    b1.play_again
  end

end

tic_tac = Tic_tac_toe.new.run




