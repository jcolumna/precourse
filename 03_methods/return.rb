#return.rb

def add_three(number)
  return number + 3
  number + 4
end

def just_assignment(number)
  foo = number + 3
end

returned_value = just_assignment(2)
puts returned_value