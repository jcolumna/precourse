#rps.rb
#Joshua Columna
#Edited 10/15/14

require 'pry'

CHOICES = { 'p' => 'Paper', 'r' => 'Rock', 's' => 'Scissors' }

puts "Welcome to Rock, Paper, Scissors!"

#In an attempt to make rps.rb more DRY, I decided to define a test to find
#a winner, and return a phrase to end the game. Ex: "Rock crushes Scissors! You win!"
#As the test grew, I realized this one method is actually the meat of the entire program.
def win_test (c_array)
  phrase = winning_phrase(c_array)
  if c_array.first == c_array.last
    puts "You chose #{c_array.first}.."
    sleep (1)
    puts "But so did the computer!"
    sleep (0.5)
    puts "It's a tie!"
    sleep (1.5)
    play_again
  elsif (c_array.first == 'Paper' && c_array.last == 'Rock') ||
    (c_array.first == 'Rock' && c_array.last == 'Scissors') ||
    (c_array.first == 'Scissors' && c_array.last == 'Paper')
    puts "You chose #{c_array.first}."
    sleep (0.5)
    puts "Computer chose..."
    sleep (0.5)
    puts "#{c_array.last}!"
    sleep (1)
    puts phrase
    sleep (0.5)
    puts "You win!"
    sleep (1.5)
    play_again
  else
    puts "You chose #{c_array.first}."
    sleep (0.5)
    puts "Computer chose..."
    sleep (0.5)
    puts "#{c_array.last}!"
    sleep (1)
    puts phrase
    sleep (0.5)
    puts "Computer wins..."
    sleep (1.5)
    play_again
  end
end

#Return an action phrase based on which two choices are in this particular game.
def winning_phrase(c_array)
  if c_array.include?('Paper') && c_array.include?('Rock')
    phrase = "Paper wraps Rock!"
  elsif c_array.include?('Paper') && c_array.include?('Scissors')
    phrase = "Scissors cuts Paper!"
  else phrase = "Rock crushes Scissors!"
  end
end
      
#Decided I wanted to pass around the expanded versions of the answers.      
def expand_choice (choice)
  if choice == 'r'
    choice = 'Rock'
  elsif choice == 'p'
    choice = 'Paper'
  else choice = 'Scissors'
  end
end

#Prompt for another game
def play_again
  puts "Play again? (y/n)"
  input = gets.chomp
  if input.casecmp('y') == 0
    game_over = false
  else
    game_over = true
  end
end

begin
  # player makes a pick
  begin
    puts "Pick one: (r, p, s):"
    player_choice = gets.chomp.downcase
  end until CHOICES.keys.include?(player_choice)

  player_choice = expand_choice(player_choice)
  
  # computer makes a pick
  computer_choice = CHOICES.keys.sample
  computer_choice = expand_choice(computer_choice)
  choice_arr = [player_choice, computer_choice]

  game_over = win_test(choice_arr)
end until game_over