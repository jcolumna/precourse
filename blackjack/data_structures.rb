#blackjack_again.rb

deck = [ 'h2', 'd2', 'c2', 's2', 'h3', 'd3', 'c3', 's3', 'h4', 'd4', 'c4', 's4', 'h5', 'd5', 'c5', 's5', 'h6', 'd6', 'c6', 's6',
         'h7', 'd7', 'c7', 's7', 'h8', 'd8', 'c8', 's8', 'h9', 'd9', 'c9', 's9', 'ht', 'dt', 'ct', 'st', 'hj', 'dj', 'cj', 'sj',
         'hq', 'dq', 'cq', 'sq', 'hk', 'dk', 'ck', 'sk', 'ha', 'da', 'ca', 'sa' ]      

players_hand = []
$card_str    

def draw_card(array)
  card = array.shuffle.pop
  suit = card.each_char.to_a[0]
  value = card.each_char.to_a[1]
  
  if suit == 'h'
    suit = "Hearts"
  elsif suit == 'd'
    suit = "Diamonds"
  elsif suit == 'c'
    suit = "Clubs"
  elsif suit == 's'
    suit = "Spades"
  end

  case value
  when 't'
    value = '10'
  when 'j'
    value = 'Jack'
  when 'q'
    value = 'Queen'
  when 'k'
    value = 'King'
  when 'a'
    value = 'Ace'
  end
  
  $card_str = "The #{value} of #{suit}."  
end    

puts "You saunter on to the house floor. You're a cool cat, ready to pounce on some easy green."
sleep (2)
puts "Sitting down at a table, you casually set down your meager stack. You are ready to make it grow."
sleep (4)

puts '"What\'s your name, Mister?" The dealer glances your way, and before you know it two crisp, '
puts "clean cards twirl to a stop right next to your chips."

sleep (6)

puts '"Name? The name\'s..."'
sleep(1)
puts "(Input your name)"
name = gets.chomp
sleep(1)

puts '"#{name}. Just #{name}." The words roll off your tongue, smooth. Like silk.'

sleep (3)

puts "You take a look at your hand. Your cards are:"

draw_card(deck)
puts $card_str
puts "and"
draw_card(deck)
puts $card_str

'''
c1 = deck.shuffle.pop
c2 = deck.shuffle.pop



players_hand.push(deck.shuffle.pop)
players_hand.push(deck.shuffle.pop)
'''



