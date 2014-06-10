#ex1.rb

family = { uncles: ["bob", "joe", "steve"],
           sisters: ["jane", "jill", "beth"],
           brothers: ["frank", "rob", "david"],
           aunts: ["mary", "sally", "susan"]
         }

array = family.select { |k,v| (k == :brothers) || (k == :sisters) }
p array.values.flatten