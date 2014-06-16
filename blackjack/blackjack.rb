#blackjack.rb

require 'pry'

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

$card_str
player_hand = []
dealer_hand = []
$player_total
$dealer_total

def draw_card(array)
 
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
  
  $card_str = { "The #{say_value} of #{suit}" => value }
  '''
  if $card_str == "The Ace of Spades."
    $card_str = "The Ace of Spades!"
  end
  '''
end

def print_hand(array) 

  puts "You take a look at your hand. Your cards are:"

  array.each { |e| puts *e.keys }
  puts "Right now you're at..."

  $player_total = 0
  aces = 0
  array.each  do |e|
    val = e.values[0]
    if val == 'a' #It's an ace. Save this addition till last...
      aces += 1
    else
      $player_total += val
    end
  end

  while aces > 0 do
    if $player_total + 11 > 21
      $player_total += 1 # Use 11 as the value unless it would make the player bust.
    else
      $player_total += 11
    end
    aces -= 1
  end

  puts $player_total
  win_test

end

def print_dealer_hand(array) 

  puts "The dealer's hand is:"

  array.each { |e| puts *e.keys }
  puts "So that means the dealer has:"

  $dealer_total = 0
  aces = 0
  array.each  do |e|
    val = e.values[0]
    if val == 'a' #It's an ace. Save this addition till last...
      aces += 1
    else
      $dealer_total += val
    end
  end

  while aces > 0 do
    if $dealer_total + 11 > 21
      $dealer_total += 1 # Use 11 as the value unless it would make the player bust.
    else
      $dealer_total += 11
    end
    aces -= 1
  end

  puts $dealer_total
 
end

def win_test
  if $player_total == 21
    puts "CONGRATS, YOU WIN!!!!"
    abort
  elsif  
    $player_total > 21
    puts "Bust! Try again?"
    abort
  end
end

def dealer_win_test
  if $dealer_total == 21
    puts "Dealer has 21. House wins! Better luck next time..."
    abort
  elsif $dealer_total > 21 
    puts "The house is bust! You win!!!"
    abort
  elsif $player_total == $dealer_total
    puts "It's a push. One more time?"
    abort
  elsif $player_total > $dealer_total
    puts "House has #{$dealer_total} and you have #{$player_total}! You win!!!"
    abort
  elsif $player_total < $dealer_total
    puts "House has #{$dealer_total} and you have #{$player_total}. House wins this time..."
    abort
  end
end
    
    




draw_card(deck)
player_hand << $card_str
draw_card(deck)
player_hand << $card_str

print_hand(player_hand)

#The while loop begins!!!!!
input = ''
while input.upcase != 'B' do
puts "What will you do? A.) Hit, B.) Stay"

input = gets.chomp

  if input.upcase == 'A'
    puts "The dealer smirks and twirls another card in your direction."
    draw_card(deck)
    player_hand << $card_str
    print_hand(player_hand)
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

puts "After two cards, the dealer has:"

draw_card(deck)
dealer_hand << $card_str
draw_card(deck)
dealer_hand << $card_str
print_dealer_hand(dealer_hand)

sleep(3)

while $dealer_total < 17 do
  puts "The house hits again..."
  draw_card(deck)
  dealer_hand << $card_str
  print_dealer_hand(dealer_hand)
  sleep(3)
end

  dealer_win_test






