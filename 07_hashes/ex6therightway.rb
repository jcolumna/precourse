#ex6therightway.rb

# I did exercise 6 however I could manage without looking at the solution.
# But the given solution looked much more elegant so I'm going to 
# reconstruct it from memory after having watched the video.

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

final = {}

words.each do |word|

  key = word.chars.sort.join

  if final.has_key?(key)
   final[key] << word
  else
   final[key] = [word]
  end
end

final.each { |k, v| p v }