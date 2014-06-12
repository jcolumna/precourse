#ex2.rb

string = ""
while string != "STOP"
  puts "Input a string. (Input STOP when finished.)"
  string = gets.chomp
  puts string.capitalize
end