#ex2.rb

h1 = { a: 256, b: 72}
h2 = { b: 101, c: 97}

puts h1.merge(h2)
puts h1 #h1 will not have changed
puts h1.merge!(h2)
puts h1 #h1 is now mutated