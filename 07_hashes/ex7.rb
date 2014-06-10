#ex7.rb

x = "hi there"
my_hash = {x: "some value"}
my_hash2 = {x => "some value"}

'''
The first hash uses the symbol :x as a key, which is created at the same 
time we are initializing my_hash.

The second hash uses the string "hi there" as a key, because it\'s the 
value pointed to by the variable x, which we created earlier.
'''