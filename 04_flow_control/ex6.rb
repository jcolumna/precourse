#ex6.rb

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