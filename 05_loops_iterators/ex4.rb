ex4.rb

def countdown_recursive(number)
  if number <= 0
    puts number
  else
    countdown_recursive(number - 1)
    puts number
  end
end

countdown_recursive(7)