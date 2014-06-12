#ex17.rb

#What will the following program output?

hash1 = {shoes: "nike", "hat" => "adidas", :hoodie => true}
hash2 = {"hat" => "adidas", :shoes => "nike", hoodie: true}

if hash1 == hash2
  puts "These hashes are the same!"
else
  puts "These hashes are not the same!"
end

#I believe that since hashes are not ordered, and symbols are used for
#shoes and hoodie in both hashes, despite the change in syntax, they are, 
#in fact, the same.

#After testing above code I can conclude that I was correct in my hypothesis!