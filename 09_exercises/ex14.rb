#ex14.rb

contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

keys = [:email, :address, :phone]

i = 0

contacts.each do |name, hash|
  keys.each do |key|
    hash[key] = contact_data[i/3].shift
    i += 1
  end
end

p contacts["Joe Smith"]


