#ex9.rb

h = {a:1, b:2, c:3, d:4}

puts "h: "
p h

puts "h[:b]:"
puts h[:b]

h[:e] = 5

puts "h: "
p h

h.select!{ |k, v| v > 3.5 }

puts "h: "
p h