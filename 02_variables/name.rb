#name.rb

#1 and #4 for variables lesson
puts "What is your first name?"
first_name = gets.chomp
puts "..And your last name is..."
last_name = gets.chomp
puts "Hello there, " + first_name + " " + last_name +"!"

#3
name = first_name + " " + last_name
10.times do 
	puts name
end
