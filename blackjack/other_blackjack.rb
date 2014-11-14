#other_blackjack.rb
#This is the same as other_blackjack.rb only it has the hand draw function...
#Joshua Columna
#10/21/14

#require 'pry'

#Allow the player to place a bet on a the next hand before any cards are dealt.
#Deal two cards to player and dealer, leaving dealer's second card face down.
#Options: allow player to split if their two cards are of the same value.
# no doubling down or splitting is allowed on the already split hands.
#Options: Allow the player to double down, doubling their bet if their total is 10 or 11, 
# and taking only one more hit afterwards.
#Options: If the dealer's face card is an ace, allow the player to buy insurance at a rate of half their bet.
#If the dealer's hole card is a ten when their face card is an ace, house wins unless it was a push.
# If insurance was bought and house did have blackjack, player keeps their chips. Otherwise, the extra half bet is lost.
#Either way, game over.
#Ask the player if he wants to hit until he decides not to.
#If the player busts, game over.
#Once the player decides to stay, flip the dealer's hole card. 
#House has to hit until they have at least 17.
#If the house busts, game over.
#Compare the player's score to the house's score. The higher value wins.
#Game over.
#If neither is higher, it's a push.
#Game over.




def calculate_total(hand) #[['2', 's'], ['a', 'd'], ... etc.] 
  
  total = 0
  aces = 0
  hand.each do |card|
    if ['J', 'Q', 'K'].include?(card[0])
      total += 10
    elsif card[0] == 'A'
      aces += 1
    else 
      total += card[0].to_i
    end
  end
  
  while aces > 0
    if total + 11 > 21
      total += 1
    else
      total += 11
    end
    aces -= 1
  end
  total
end


# def draw_board(pcards, dcards)
# end

def draw_hand(hand, who = 'Dealer', display_last = false)
  #Count the number of cards in a hand and display each part that many times on one line.
  #If !display_last, don't print the last card.
    #If you're gonna use an iterator, just use it for everything.
    #hand[c][val]

  c = 0
  last = []
  if !display_last
    last = hand.pop
    hand.push(["?","X"])
  end
  hand.each {c +=1}
  spaces = c * 11 / 2 - 6 
  #crappy formatting method attempts to center align the text
  spaces.times do 
    print " "
  end
  puts "#{who}'s Hand"
  c.times { print " +---*---+ " }
  puts ""
  hand.each { |card| print " | #{card[1]}     | " }
  #i = 0 
  #while i < c 
  puts ""
  c.times { print " |       | " }
  puts ""
     
  hand.each do |card|
    if card[0].to_i == 10
      print " |  #{card[0]}   | "
    else
      print " |   #{card[0]}   | "
    end
  end
  puts ""  
  c.times { print " |       | " }
  puts ""  
  hand.each { |card| print " |     #{card[1]} | " }
  puts ""  
  c.times { print " +---*---+ " }
  if display_last
    print "Total: #{calculate_total(hand)}"
  else
    hand.pop
    print "Total Shown: #{calculate_total(hand)}"
  end
  if last != []
    hand.push(last)
  end
  puts ""  
end

#Possible to include "Play Again?" logic here?
def draw_board(mycards, dealercards, prompt, msg, dealers_turn = false)
  system 'cls' or system 'clear'
  puts "#{prompt}"
  puts ""
  draw_hand(mycards, 'Player', true)
  puts ""
  draw_hand(dealercards, 'Dealer', dealers_turn)
  puts ""
  puts msg
  if !dealers_turn
    input = gets.chomp
  end
end

values = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
suits = ["\u2665", "\u2666", "\u2663", "\u2660"] #Hearts, Diamonds, Clubs, Spades


deck = values.product(suits)

deck = deck.shuffle!

mycards = []
dealercards = []

#initial deal

2.times do
  mycards << deck.pop
  dealercards << deck.pop
end

#print out the initial hands
#puts "You have #{mycards}, for a total of #{calculate_total(mycards)}."
#puts "Dealer has #{dealercards}, for a total of #{calculate_total(dealercards)}."

#FIRST: Test to see if player has BLACKJACK
#Next: If it isn't BLACKJACK, ask if they want to hit or stay.
#Then: Keep asking until player either stays, or their hand value is greater than 21.
#Following that: If the player has 21, They win!
#Unfortunately: If the player has more than 21, they lose.
#Lastly: If the player chose to stay, play passes to dealer.
game_over = false
if calculate_total(mycards) == 21
  draw_board(mycards, dealercards, "Player has Blackjack!", "Congratulations! You win!") 
  game_over = true
end
if calculate_total(mycards) < 21 && !game_over
  begin
    input = draw_board(mycards, dealercards, "What would you like to do?", "(H to hit, S to stay.)")
    if input.casecmp('h') == 0 && calculate_total(mycards) < 21
      mycards << deck.pop
    end   
  end until input.casecmp('h') != 0 || calculate_total(mycards) >= 21
end
if calculate_total(mycards) == 21 && !game_over
  draw_board(mycards, dealercards, "Player has 21!!", "Congrats! You win!")
  game_over = true
elsif calculate_total(mycards) > 21
  draw_board(mycards, dealercards, "You bust!", "Better luck next time...")
  game_over = true
end
# Next, play passes to dealer...
if !game_over
  draw_board(mycards, dealercards, "The dealer reveals their hole card...", "", true)
  sleep (5)
  if calculate_total(dealercards) < 17
    begin 
      dealercards << deck.pop
      draw_board(mycards, dealercards, "The dealer draws a card.", "", true)
      sleep (5)
    end until calculate_total(dealercards) >= 17
  end
end
# The totals aren't going to change any further so we can just store the values instead
# of calculating them all the time.
dealer_total = calculate_total(dealercards)
player_total = calculate_total(mycards)
if dealer_total == 21 && !game_over
  draw_board(mycards, dealercards, "Dealer has Blackjack!", "Oh no!! You lose.. Try again?", true)
  game_over = true
elsif dealer_total > 21 && !game_over
  draw_board(mycards, dealercards, "The house is bust!", "Congratulations, you win!", true)
  game_over = true
elsif dealer_total == player_total && !game_over
  draw_board(mycards, dealercards, "It's a push~", "No winners this time...", true)
  game_over = true
elsif dealer_total > player_total && !game_over
  draw_board(mycards, dealercards, "Dealer wins!", "Better luck next time...", true)
  game_over = true
elsif dealer_total < player_total  && !game_over
  draw_board(mycards, dealercards, "You win, Player!", "Congratulations!!", true)  
  game_over = true
end









