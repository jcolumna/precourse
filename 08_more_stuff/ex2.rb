#ex2.rb

# What gets output to the screen?
# What is returned?

def execute(&block)
  block
end

execute { puts "Hello from inside the execute method!" }

# Hello from inside the execute method!
# ^ This should be the output on the screen... 
# I think it will return nil though, since it's 
# just calling a puts statement.

# The above was what I thought would happen.
# What actually happens is nothing is output, 
# and the result is a pointer to some hex address.

# The solution tells me we didn't get any output because
# we never used block.call
# Also the thing that's returned is called a Proc object.