#other_blackjack.rb
#This is the same as other_blackjack.rb only it has the hand draw function...
#Joshua Columna
#11/28/14

#require 'pry'

#Deal two cards to player and dealer, leaving dealer's second card face down.
#If the player has blackjack, flip the dealer's hole card and compare.
#If house has blackjack too, it's a push, otherwise, player wins. Game over.
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

def draw_hand(hand, who = 'Dealer', display_last = false)
  #Count the number of cards in a hand and display each part that many times on one line.
  #If !display_last, don't print the last card.

  c = 0
  last = []
  if !display_last
    last = hand.pop
    hand.push(["?","X"])
  end
  hand.each {c +=1}
  spaces = c * 11 / 2 - 6 
  #crappy formatting method attempts to center align the hand's header.
  #Works fine if the name is 6 chars long, ie. 'Player' or 'Dealer'
  #But starts to get askew the longer the name is.
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

def draw_board(mycards, dealercards, prompt, msg, dealers_turn = false, needs_input = true)
  system 'cls' or system 'clear'
  puts "#{prompt}"
  puts ""
  draw_hand(mycards, NAME, true)
  puts ""
  draw_hand(dealercards, 'Dealer', dealers_turn)
  puts ""
  puts msg
  if !dealers_turn && needs_input
    input = gets.chomp
  end
end

def blackjack_check(pl_cards, dl_cards) 
  draw_board(pl_cards, dl_cards, "#{NAME} has Blackjack!", "Dealer has...", false, false)
  sleep (3)
  if calculate_total(dl_cards) == 21
    draw_board(pl_cards, dl_cards, "Dealer also has Blackjack...", "No winners this time~", true)
  else
    draw_board(pl_cards, dl_cards, "Dealer only has #{calculate_total(dl_cards)} total!", "Congrats, #{NAME} wins!", true) 
  end
end

puts ""
puts "Welcome to Blackjack!"
puts ""
puts "May I have your name?"
NAME = gets.chomp
puts "Thanks for joining us, #{NAME}!"
sleep (2)
puts "Let's begin, shall we?"
sleep (1)

begin
  values = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
  suits = ["\u2665", "\u2666", "\u2663", "\u2660"] #Hearts, Diamonds, Clubs, Spades

  deck = values.product(suits)

  deck = deck.shuffle!

  mycards = []
  dealercards = []

  #initial deal
   #mycards << ['J', "\u2665"] #---- These lines are for testing blackjack
   #mycards << ['A', "\u2665"]
   #dealercards << ['J', "\u2665"]
   #dealercards << ['A', "\u2665"]
  
  2.times do
    mycards << deck.pop
    dealercards << deck.pop
  end

  game_over = false
  if calculate_total(mycards) == 21 #Player wins unless dealer also has blackjack
    blackjack_check(mycards, dealercards)
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
    blackjack_check(mycards, dealercards)
    game_over = true
  elsif calculate_total(mycards) > 21
    draw_board(mycards, dealercards, "#{NAME} busts!", "Better luck next time, #{NAME}...", false, false)
    game_over = true
  end
  # Next, play passes to dealer...
  if !game_over
    draw_board(mycards, dealercards, "The dealer reveals their hole card...", "", true)
    sleep (3)
    if calculate_total(dealercards) < 17
      begin 
        dealercards << deck.pop
        draw_board(mycards, dealercards, "The dealer draws a card.", "", true)
        sleep (2)
      end until calculate_total(dealercards) >= 17
    end
  end
  # The totals aren't going to change any further so we can just store the values instead
  # of calculating them all the time.
  dealer_total = calculate_total(dealercards)
  player_total = calculate_total(mycards)
  if dealer_total == 21 && !game_over
    draw_board(mycards, dealercards, "Dealer has Blackjack!", "Oh no!! #{NAME} loses.. ", true)
    game_over = true
  elsif dealer_total > 21 && !game_over
    draw_board(mycards, dealercards, "The house is bust!", "Congratulations, #{NAME} wins!", true)
    game_over = true
  elsif dealer_total == player_total && !game_over
    draw_board(mycards, dealercards, "It's a push~", "No winners this time...", true)
    game_over = true
  elsif dealer_total > player_total && !game_over
    draw_board(mycards, dealercards, "Dealer wins!", "Better luck next time, #{NAME}...", true)
    game_over = true
  elsif dealer_total < player_total  && !game_over
    draw_board(mycards, dealercards, "You win, #{NAME}!", "Congratulations!!", true)  
    game_over = true
  end
  puts ""
  puts "Play again? (y/n)"
  input = gets.chomp
  if input.casecmp('y') == 0
    game_over = false
  else
    game_over = true
  end    
end until game_over








