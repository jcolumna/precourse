#ex3.rb

def each_with_index(array)

x = 1

  array.each do |arg|
    puts "#{x}. #{arg}"
    x += 1
  end
end

sandwich = ['Bread', 'Tomato', 'Lettuce', 'Cheese', 'Meat', 'Bread']

each_with_index(sandwich)