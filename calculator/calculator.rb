#Monday, Sept. 29, 2014
#Joshua Columna

puts "What's the first number?"
num1 = gets.chomp.to_f
puts "The number is #{num1}."
puts "And the second number is?"
num2 = gets.chomp.to_f
puts "The second number is #{num2}."
puts "What would you like to do?"
puts "Type A, S, M, or D to add, subtract, multiply, or divide."
modifier = gets.chomp
answer = nil
while !answer  
  if modifier.casecmp("A") == 0
    answer = num1 + num2
    puts "#{num1} plus #{num2} equals #{answer}!"
  elsif modifier.casecmp("S") == 0 
    answer = num1 - num2
    puts "#{num1} minus #{num2} equals #{answer}!"
  elsif modifier.casecmp("M") == 0
    answer = num1 * num2
    puts "#{num1} times #{num2} equals #{answer}!"
  elsif modifier.casecmp("D") == 0
    answer = num1 / num2
    puts "#{num1} divided by #{num2} equals #{answer}!"
  else puts "Invalid input. Try again!"
    puts "Type A, S, M, or D to add, subtract, multiply, or divide."
    modifier = gets.chomp
  end
end
  