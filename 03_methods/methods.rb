#methods.rb

#1
def greeting(name)
  puts "Greetings, friend " + name + "!"
end

puts "What is your name?"
name = gets.chomp
greeting(name)

#2
x = 2 #Returns 2
puts x = 2 #Returns nil, although 2 will be output to the screen.
p name = "Joe" #Returns "Joe"
four = "four" #Returns "four"
print something = "nothing" #Returns nil, although 'nothing' will be output to the screen.
#Also noted that print does not include a return character (At least in my win7 environment.)

#3
def multiply(first, second)
  first * second
end

puts multiply(3, 4)

#4
#It will not print anything to the screen because there is a return statement in the method
#before the puts statement.

#5
def scream(words)
  words = words + "!!!!"
  #return
  puts words
end

scream("Yippeee")

#In this case, Yippeee!!!! is printed to the screen,
#but it will return nil because the last statement 
#evaluated was a puts statement.

#6
#The error message tells you that the method was expecting two arguments to be passed
#but you only gave it one.