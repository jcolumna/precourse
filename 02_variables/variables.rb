#variables.rb

#1 - See name.rb
#2 - See age.rb
#3 - See name.rb
#4 - See name.rb

#5a.
'''x = 0
3.times do
  x += 1
end
puts x #x should equal 3 here.
'''
#5b.
y = 0

3.times do
  y += 1
  x = y
end
puts x #This will throw an error because x was not defined in this scope.

#6
#This error tells you that you tried to use the variable 'shoes' in your code
#but 'shoes' hasn't been defined yet.