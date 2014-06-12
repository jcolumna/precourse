#ex3.rb

numbarz = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = numbarz.select { |num| num.odd? }

puts new_array