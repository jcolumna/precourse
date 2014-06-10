#ex5.rb

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