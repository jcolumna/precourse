#ex1.rb

#regex mode activate!

strings = ["laboratory", "experiment", "Pans Labyrinth", "elaborate", "polar bear"]

strings.each do |str| 
  if str =~ /lab/ 
    puts str
  end
end

# I notice that Labyrinth doesn't qualify for being print out in this case.
# One could have it compare and ignore case but that's not within the scope 
# of this question.