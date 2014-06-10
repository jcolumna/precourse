#loops_and_iterators.rb

#1

x = [1, 2, 3, 4, 5]

x.each do |a|
  a + 1
end

#This will return the array in its original form => [1, 2, 3, 4, 5]
#because the loop doesn't actually change the contents

#2
string = ""
while string != "STOP"
  puts "Input a string. (Input STOP when finished.)"
  string = gets.chomp
  puts string.capitalize
end

#3

def each_with_index(array)

x = 1

  array.each do |arg|
    puts "#{x}. #{arg}"
    x += 1
  end
end

sandwich = ['Bread', 'Tomato', 'Lettuce', 'Cheese', 'Meat', 'Bread']

each_with_index(sandwich)

#4

def countdown_recursive(number)
  if number <= 0
    puts number
  else
    countdown_recursive(number - 1)
    puts number
  end
end

countdown_recursive(7)