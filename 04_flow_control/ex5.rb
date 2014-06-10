#ex5.rb

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