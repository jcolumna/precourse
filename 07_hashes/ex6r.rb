#ex6.rb <-refactored

# This was my attempt to make all the keywords act the way that I wanted
# them to. ie. "Key" means the thing that we compare everything else to.

words = ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
         'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
         'flow', 'neon']

keys = words.map { |word| word.chars.sort.join }
keys.uniq!

# The following line is the one that was giving me issues. Apparently,
# when you have duplicate keys, they overwrite each other.
sorty_thing = Hash[words.map { |word| [ word.chars.sort.join, word ] } ]

final =[]

keys.each do |key|
  temp = sorty_thing.select { |k, v| k == key }
  final << temp.values
end

p final