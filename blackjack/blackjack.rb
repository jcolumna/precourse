#blackjack.rb

require 'pry'

name = ''

def draw_card(array, result_hash)
  result_hash.clear
  card = array.pop
  
  suit = card.each_char.to_a[0]
  say_value = card.each_char.to_a[1]
  value = say_value
  
  if suit == 'h'
    suit = "Hearts"
  elsif suit == 'd'
    suit = "Diamonds"
  elsif suit == 'c'
    suit = "Clubs"
  elsif suit == 's'
    suit = "Spades"
  end

  case say_value
  when 't'
    say_value = '10'
  when 'j'
    say_value = 'Jack'
  when 'q'
    say_value = 'Queen'
  when 'k'
    say_value = 'King'
  when 'a'
    say_value = 'Ace'
  end

  case value
  when 't'
    value = 10
  when 'j'
    value = 10
  when 'q'
    value = 10
  when 'k'
    value = 10
  when 'a'
    value = 'a'#[ 1, 11 ]
  else 
    value = value.to_i
  end

  result_hash["The #{say_value} of #{suit}"] = value 
  '''
  if $card_str == "The Ace of Spades."
    $card_str = "The Ace of Spades!"
  end
  '''
end

def print_hand(array, accumulator, name) 

  
  puts ""
  puts "-=-*'`'*-=.,.=-*'`'*'`'*'`'*-=.,.=-*'`'*'`'*-=-"
  puts ""
  sleep(1)
  puts "You take a look at your hand. #{name}'s Cards:"

  array.each { |e| puts *e.keys }
  puts "Right now you're at..."

  accumulator = 0
  aces = 0
  array.each  do |e|
    val = e.values[0]
    if val == 'a' #It's an ace. Save this addition till last...
      aces += 1
    else
      accumulator += val
    end
  end

  while aces > 0 do
    if accumulator + 11 > 21
      accumulator += 1 # Use 11 as the value unless it would make the player bust.
    else
      accumulator += 11
    end
    aces -= 1
  end

  puts accumulator
  win_test(accumulator, name)
  return accumulator

end

def print_dealer_hand(array, accumulator) 

  puts ""
  puts "-=-*'`'*-=.,.=-*'`'*'`'*'`'*-=.,.=-*'`'*'`'*-=-"
  puts ""
  sleep(1)
  puts "The dealer's hand is:"

  array.each { |e| puts *e.keys }
  puts "So that means the dealer has:"

  accumulator = 0
  aces = 0
  array.each  do |e|
    val = e.values[0]
    if val == 'a' #It's an ace. Save this addition till last...
      aces += 1
    else
      accumulator += val
    end
  end

  while aces > 0 do
    if accumulator + 11 > 21
      accumulator += 1 # Use 11 as the value unless it would make the player bust.
    else
      accumulator += 11
    end
    aces -= 1
  end

  puts accumulator
  return accumulator
 
end

def win_test(num, name)
  if num == 21
    puts "CONGRATS, #{name} WINS!!!!"
    puts "One more time? [Y, N]"
    input = gets.chomp
    if input.upcase == 'Y'
      main(name)
    else
      puts "Thanks for playing!"
      abort
    end

  elsif  
    num > 21
    puts "#{name} Busts!"
    puts "Try again? [Y, N]"
    input = gets.chomp
    if input.upcase == 'Y'
      main(name)
    else
      puts "Thanks for playing!"
      abort
    end
  end
end

def dealer_win_test(dealer, player, name)
  if dealer == 21
    puts "Dealer has 21. House wins! Better luck next time..."
    puts "Try again? [Y, N]"
    input = gets.chomp
    if input.upcase == 'Y'
      main(name)
    else
      puts "Thanks for playing!"
      abort
    end
  elsif dealer > 21 
    puts "The house is bust! #{name} wins!!!"
    sleep(1)
    puts "Go for another? [Y, N]"
    input = gets.chomp
    if input.upcase == 'Y'
      main(name)
    else
      puts "Thanks for playing!"
      abort
    end
  elsif player == dealer
    puts "It's a push."
    sleep(1)
    puts "One more time? [Y, N]"
    input = gets.chomp
    if input.upcase == 'Y'
      main(name)
    else
      puts "Thanks for playing!"
      abort
    end
  elsif player > dealer
    puts "House has #{dealer} and #{name} has #{player}! #{name} wins!!!"
    sleep(1)
    puts "One more time? [Y, N]"
    input = gets.chomp
    if input.upcase == 'Y'
      main(name)
    else
      puts "Thanks for playing!"
      abort
    end
  elsif player < dealer
    puts "House has #{dealer} and #{name} has #{player}. House wins this time..."
    sleep(1)
    puts "Try again? [Y, N]"
    input = gets.chomp
    if input.upcase == 'Y'
      main(name)
    else
      puts "Thanks for playing!"
      abort
    end
  end
end
    
def get_player_name

  puts "Hey there, stranger, what's your name?"
  name = gets.chomp
end

def main(name)

  if name.empty? 
    name = get_player_name
  end

  deck = [ 'h2', 'd2', 'c2', 's2', 'h3', 'd3', 'c3', 's3', 'h4', 'd4', 'c4', 's4', 'h5', 'd5', 'c5', 's5', 'h6', 'd6', 'c6', 's6',
           'h7', 'd7', 'c7', 's7', 'h8', 'd8', 'c8', 's8', 'h9', 'd9', 'c9', 's9', 'ht', 'dt', 'ct', 'st', 'hj', 'dj', 'cj', 'sj',
           'hq', 'dq', 'cq', 'sq', 'hk', 'dk', 'ck', 'sk', 'ha', 'da', 'ca', 'sa',
           'h2', 'd2', 'c2', 's2', 'h3', 'd3', 'c3', 's3', 'h4', 'd4', 'c4', 's4', 'h5', 'd5', 'c5', 's5', 'h6', 'd6', 'c6', 's6',
           'h7', 'd7', 'c7', 's7', 'h8', 'd8', 'c8', 's8', 'h9', 'd9', 'c9', 's9', 'ht', 'dt', 'ct', 'st', 'hj', 'dj', 'cj', 'sj',
           'hq', 'dq', 'cq', 'sq', 'hk', 'dk', 'ck', 'sk', 'ha', 'da', 'ca', 'sa',
           'h2', 'd2', 'c2', 's2', 'h3', 'd3', 'c3', 's3', 'h4', 'd4', 'c4', 's4', 'h5', 'd5', 'c5', 's5', 'h6', 'd6', 'c6', 's6',
           'h7', 'd7', 'c7', 's7', 'h8', 'd8', 'c8', 's8', 'h9', 'd9', 'c9', 's9', 'ht', 'dt', 'ct', 'st', 'hj', 'dj', 'cj', 'sj',
           'hq', 'dq', 'cq', 'sq', 'hk', 'dk', 'ck', 'sk', 'ha', 'da', 'ca', 'sa',
           'h2', 'd2', 'c2', 's2', 'h3', 'd3', 'c3', 's3', 'h4', 'd4', 'c4', 's4', 'h5', 'd5', 'c5', 's5', 'h6', 'd6', 'c6', 's6',
           'h7', 'd7', 'c7', 's7', 'h8', 'd8', 'c8', 's8', 'h9', 'd9', 'c9', 's9', 'ht', 'dt', 'ct', 'st', 'hj', 'dj', 'cj', 'sj',
           'hq', 'dq', 'cq', 'sq', 'hk', 'dk', 'ck', 'sk', 'ha', 'da', 'ca', 'sa' ]


  deck.shuffle!         

  card_hash = {}
  player_hand = []
  dealer_hand = []
  player_total = 0
  dealer_total = 0

  draw_card(deck, card_hash)
  player_hand.push( card_hash )
  card_hash = player_hand[0].dup

  draw_card(deck, card_hash)
  player_hand.push( card_hash )
  card_hash = player_hand[0].dup

  player_total = print_hand(player_hand, player_total, name)

  #The while loop begins!!!!!
  input = ''
  while input.upcase != 'B' do
  puts "What will you do? A.) Hit, B.) Stay"

  input = gets.chomp

    if input.upcase == 'A'
      puts "The dealer smirks and twirls another card in your direction."
      draw_card(deck, card_hash)
      player_total = player_hand.push( card_hash )
      card_hash = player_hand[0].dup
      player_total = print_hand(player_hand, player_total, name)
    elsif input.upcase =='B'
      break
    else
      puts "ERRNK!! Wrong answer. Try again~"
    end
  end

  puts "Play passes to the dealer."
  sleep(1.5)
  puts "The dealer begins to make their move..."

  sleep(1)

  puts "After two cards, you can see the dealer's hand."

  draw_card(deck, card_hash)
  dealer_hand << card_hash
  card_hash = dealer_hand[0].dup
  draw_card(deck, card_hash)
  dealer_hand << card_hash
  card_hash = dealer_hand[0].dup
  dealer_total = print_dealer_hand(dealer_hand, dealer_total)

  sleep(3)

  while dealer_total < 17 do
    puts "The house hits again..."
    draw_card(deck, card_hash)
    dealer_hand << card_hash
    card_hash = dealer_hand[0].dup
    dealer_total = print_dealer_hand(dealer_hand, dealer_total)

    sleep(3)
  end

  dealer_win_test(dealer_total, player_total, name)

end

main(name)