#ex6.rb

names = ['bob', 'joe', 'susan', 'margaret']

#names['margaret'] = 'jody'
#This throws an error because array[] expects an integer as input.
#If you want to get the index of 'margaret' and put it in there 
#you can do:
names[names.index('margaret')] = 'jody'
puts names.to_s

#This clunky-looking thing also works
#names[names.index(names.last)] = 'jody'