#ex13.rb

contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

keys = [:email, :address, :phone]

contacts["Joe Smith"] = Hash[*keys.zip(contact_data.first).flatten]

contacts["Sally Johnson"] = Hash[*keys.zip(contact_data.last).flatten]

p contacts["Joe Smith"][:email]

p contacts["Sally Johnson"][:phone]
