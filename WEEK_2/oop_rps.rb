# oop_rps.rb

# @author - Joshua Columna
# @date   - 1/6/2015

# In rock paper scissors, you and your opponent both 
# choose one of the three options rock, paper, or scissors, 
# at the same time, and then compare to see who has 
# the winning hand.

class Player

	attr_reader :choice
  
  def initialize(choice)
    @choice = choice
  end
  
  def self.get_player_choice
    puts "Choose one: Rock, Paper, or Scissors!"
    sleep (0.5)
    puts "(Type r, p, or s to make your choice.)"
    while true
      input = gets.chomp.downcase
      unless RockPaperScissors::CHOICES.has_key?(input)
        puts "Sorry, invalid input."
        puts "(Type r, p, or s to make your choice.)"
      else
        choice = RockPaperScissors::CHOICES.fetch(input)
        puts "You chose #{choice}!"
        return choice   
      end
    end    
  end

  def compare(opponent)
    if self.choice == opponent.choice
     "Better luck next time..."
    elsif (self.choice == 'Paper' && opponent.choice == 'Rock') ||
      (self.choice == 'Rock' && opponent.choice == 'Scissors') ||
      (self.choice == 'Scissors' && opponent.choice == 'Paper')
      "You win!!"
    else
      "Oh no.. You lose. :<"
    end
  end
end

class Computer
  
  attr_reader :choice
  
  def initialize(choice)
    @choice = choice
  end
  
  def self.choose
    choice = RockPaperScissors::CHOICES.values.sample
    puts "Computer chooses #{choice}!"
    choice
  end

end

class RockPaperScissors

CHOICES = {"r" => "Rock","p" => "Paper","s" => "Scissors"}

  def self.return_choice_phrase(player, opponent)
    choices = []
    choices << player.choice
    choices << opponent.choice
    if choices.first == choices.last
      "It's a tie!"
    elsif choices.include?('Paper') && choices.include?('Rock')
      "Paper wraps Rock!"
    elsif choices.include?('Scissors') && choices.include?('Rock')
      "Rock crushes Scissors!"
    else
      "Scissors cuts Paper!"
    end
  end  
  
  def self.play_again
    puts "Play again? (y/n)"
    input = gets.chomp.downcase
    if input == "y"
      rps = RockPaperScissors.new.run
    else
      sleep(1)
      puts "Thanks for playing! :D"
    end
  end

  def run
    player1 = Player.new(Player.get_player_choice)
    sleep(1)
    computer = Computer.new(Computer.choose)
    sleep(1)
    puts "."
    sleep(0.5)
    puts "."
    sleep(0.5)
    puts "."
    sleep(0.5)
    puts RockPaperScissors.return_choice_phrase(player1, computer)
    sleep(1)
    puts player1.compare(computer)
    sleep(1)
    RockPaperScissors.play_again
  end

end

rps = RockPaperScissors.new.run


