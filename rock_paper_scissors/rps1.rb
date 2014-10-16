#rps.rb

CHOICES = { 'p' => 'Paper', 'r' => 'Rock', 's' => 'Scissors' }

puts "Welcome to Rock, Paper, Scissors!"

loop do
  # player makes a pick
  begin
    puts "Pick one: (p, r, s):"
    player_choice = gets.chomp.downcase
  end until CHOICES.keys.include?(player_choice)

  # computer makes a pick
  computer_choice = CHOICES.keys.sample

  if player_choice == computer_choice
    puts "It's a tie!"
  elsif (player_choice == 'p' && computer_choice == 'r') ||
        (player_choice == 'r' && computer_choice == 's') || 
        (player_choice == 's' && computer_choice == 'p')
    puts "You win!"
  else
    puts "Computer wins!"
  end
end