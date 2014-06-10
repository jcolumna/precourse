#ex2.rb

def caps_if_over_10(string)
  if string.length > 10
    string = string.upcase
  end
  puts string
end

puts "Input a string"
str = gets.chomp

caps_if_over_10(str) #returns str in all caps if str.length > 10