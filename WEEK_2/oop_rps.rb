# oop_rps.rb

# @author - Joshua Columna
# @date   - 1/6/2015

# In rock paper scissors, you and your opponent both 
# choose one of the three options rock, paper, or scissors, 
# at the same time, and then compare to see who has 
# the winning hand.

class Player

	attr_reader :choice
  
  def initialize 
    puts "Choose one: Rock, Paper, or Scissors!"
    sleep (0.5)
    puts "(Type r, p, or s to make your choice.)"
    valid = false
    while !valid
      input = gets.chomp.downcase
      unless RockPaperScissors::CHOICES.has_key?(input)
        puts "Sorry, invalid input."
        puts "(Type r, p, or s to make your choice.)"
      else
        choice = RockPaperScissors::CHOICES.fetch(input)
        puts "You chose #{choice}!"
        @choice =  choice 
        valid = true  
      end
    end    
  end

  def compare(opponent) #Returns a phrase based on wether the calling instance wins.
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

  # Returns a sentence, ("Rock crushes Scissors!") based 
  # on which two choices are entered in this game.
  def return_choice_phrase(opponent) 
    choices = []
    choices << self.choice
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

  def play_again
    puts "Play again? (y/n)"
    input = gets.chomp.downcase
    if input == "y"
      rps = RockPaperScissors.new.run
    else
      sleep(1)
      puts "Thanks for playing! :D"
    end
  end

end

class Computer
  
  attr_reader :choice
  
  def initialize
    choice = RockPaperScissors::CHOICES.values.sample
    puts "Computer chooses #{choice}!"
    @choice = choice
  end

end

class RockPaperScissors

CHOICES = {"r" => "Rock","p" => "Paper","s" => "Scissors"}

  def run
    player1 = Player.new
    sleep(1)
    computer = Computer.new
    sleep(1)
    puts "."
    sleep(0.5)
    puts "."
    sleep(0.5)
    puts "."
    sleep(0.5)
    puts player1.return_choice_phrase(computer)
    sleep(1)
    puts player1.compare(computer)
    sleep(1)
    player1.play_again
  end

end

rps = RockPaperScissors.new.run


