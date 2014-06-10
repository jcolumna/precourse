#ex3.rb

#I didn't realize when I was originally writing this that you were going to ask
#for a case version later... this was the version I originally wrote since
#the question didn't specify to use if/else

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