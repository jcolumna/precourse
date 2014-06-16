#blackjack.rb


deck1 = [2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 6, 6, 6, 6, 7, 7, 7, 7, 
        8, 8, 8, 8, 9, 9, 9, 9, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 
        10, 10, 10, 10, 'A', 'A', 'A', 'A']

deck2 = { two_of_hearts: 2, two_of_diamonds: 2, two_of_clubs: 2, two_of_spades: 2,
          ace_of_spades: 'a'} #etc

another_thing = { two_of_hearts: [ "Hearts", 2 ], ace_of_spades: [ "Spades", "a" ] } #etc

deck3 = { hearts: [ 2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'K', 'Q', 'A' ], 
                        diamonds: [ 2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'K', 'Q', 'A' ],
                        clubs: [ 2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'K', 'Q', 'A' ], 
                        spades: [ 2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'K', 'Q', 'A' ] } #<--- Not bad?

deck4 = [ h2, d2, c2, s2, h3, d3, c3, s3, h4, d4, c4, s4, h5, d5, c5, s5, h6, d6, c6, s6,
          h7, d7, c7, s7, h8, d8, c8, s8, h9, d9, c9, s9, h10, d10, c10, s10, hj, dj, cj, sj,
          hq, dq, cq, sq, hk, dk, ck, sk, ha, da, ca, sa ]                         


#What's a card look like? It could be as simple as an integer............

#A card has a suit, and a value. 
#In deck3, we can make it multiple decks just by adding more values to each
#of the four arrays. Not bad!

#stupid idea: if the player only has hearts and diamonds in their hand you can make a joke 
#about 'seeing red'

card = ""
player_hand = []


#suit = rand(4)

def draw_card(hash)
  suit = rand(4)
  case suit
    when 0
      suit = :hearts
    when 1
      suit = :diamonds
    when 2
      suit = :clubs
    else
      suit = :spades
    end
  card = hash[suit].shuffle.pop
  puts "The #{card} of #{suit}."
end 


puts "With a twitch of the hand, the dealer delivers you your first two cards."

puts "Your hand: "
 
draw_card(deck3)
puts "and"
draw_card(deck3)

#player_hand.push(draw_card(anothernother_thing))
#player_hand.push(draw_card(anothernother_thing))
