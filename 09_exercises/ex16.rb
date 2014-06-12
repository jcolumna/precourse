#ex16.rb

a = ['white snow', 'winter wonderland', 'melting ice',
     'slippery sidewalk', 'salted roads', 'white trees']

a = (a.map { |word| word.split(" ") }).flatten

p a