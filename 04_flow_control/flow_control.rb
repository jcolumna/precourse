#flow_control.rb

#1
'''
1. false
2. false
3. true - wrong! true does not equal 4. 
4. true
5. true
'''

#2
def caps_if_over_10(string)
  if string.length > 10
    string = string.upcase
  end
  puts string
end

puts "Input a string"
str = gets.chomp

caps_if_over_10(str) #returns str in all caps if str.length > 10

#3
puts "Input a number between 0 and 100."
number = gets.chomp.to_i

def check_num_case(num)
  case num

  when 0..50
    puts "A number between zero and fifty. Jolly good."
  when 50..100
    puts "Eggzellent. A number between fifty-one and one hundred."
  when 100..Float::INFINITY
    puts "Well now you've just gone too far."
  else
    puts "Stop being so negative."
  end
end

check_num_case(number)
#4
'''
Pre-recorded guesses
1. FALSE
2. Did you get it right?
3. Alright now!
'''

'4' == 4 ? puts("TRUE") : puts("FALSE")

x = 2

if ((x * 3) / 2) == (4 + 4 - x - 3)
  puts "Did you get it right?"
else
  puts "Did you?"
end

y = 9
x = 10
if (x + 1) <= (y)
  puts "Alright."
elsif (x + 1) >= (y)
  puts "Alright now!"
elsif (y + 1) == x
  puts "ALRIGHT NOW!"
else
  puts "Alrighty!"
end
#Sweet! I got them all correct.

#5
#I wrote the case version for my number 3, so I guess I'll write
#the if/elsif/else version here.

puts "Input a number between 0 and 100."
number = gets.chomp.to_i

def check_num_else(num)
  if num < 0 
    puts "This, my good sir, is a negative number."
  elsif num <= 50
    puts "A number between zero and fifty. Jolly good."
  elsif num <=100
    puts "Eggzellent. A number between fifty-one and one hundred."
  else
    puts "Well now you've just gone too far."
  end
end
    
check_num_else(number)

#6
'''
def equal_to_four(x)
  if x == 4
    puts "yup"
  else
    puts "nope"
end
'''
#This version throws an error because there isnt an 'end' statement
#to close the if/else statements. A corrected version looks like:

def equal_to_four(x)
  if x == 4
    puts "yup"
  else
    puts "nope"
  end
end

equal_to_four(5)    