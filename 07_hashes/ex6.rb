#ex6.rb

words = ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
         'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
         'flow', 'neon']

keys = words.map { |word| word.chars.sort.join }
keys.uniq!

sorting_hash = Hash[words.map { |word| [ word, word.chars.sort.join ] } ]
#I wanted to make the sorted value the key, but when you do it that way
#you have many duplicate values so they are all lost except the last ones.

final =[]

keys.each do |val| #Yes this line looks funny. 
  temp = sorting_hash.select { |k, v| v == val }
  final << temp.keys
end

final.each { |group| p group }



