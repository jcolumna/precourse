#ex6.rb <-refactored

words = ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
         'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
         'flow', 'neon']

keys = words.map { |word| word.chars.sort.join }
keys.uniq!

sorty_thing = Hash[words.map { |word| [ word.chars.sort.join, word ] } ]

final =[]

keys.each do |key|
  temp = sorty_thing.select { |k, v| k == key }
  final << temp.values
end

p final