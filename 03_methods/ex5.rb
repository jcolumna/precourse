#ex5.rb

def scream(words)
  words = words + "!!!!"
  #return
  puts words
end

scream("Yippeee")

#In this case, Yippeee!!!! is printed to the screen,
#but it will return nil because the last statement 
#evaluated was a puts statement.