#ex1.rb

def greeting(name)
  puts "Greetings, friend " + name + "!"
end

puts "What is your name?"
name = gets.chomp
greeting(name)