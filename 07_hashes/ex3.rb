#ex3.rb

hashhh = {one: "fish", two: "fissh", red: "fisssh", blue: "fissssh"}

puts "Let's print some keys!"

hashhh.each_key { |k| puts k }

puts "Now, let's print some values."
puts hashhh.values

puts "Aand finally, the whole sha-bang!!"

hashhh.each do |k, v|
  puts "Key #{k}'s value is #{v}!"
end