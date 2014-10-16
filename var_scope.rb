#var_scope.rb

#this_is_my_var_this_is_my_gun = 'a'

thing_1 = [1,2,3,4,5,6]
thing_1.each do |m|

  thing_1.each do |n|
    this_is_my_var_this_is_my_gun = 'floobledooble'
    #this_is_not_my_var_nor_is_it_my_gun = 'cheeseburger'
  end
  puts this_is_my_var_this_is_my_gun
end

3.times do
  this_is_my_var_this_is_my_gun = 'Macho Cheese'
end


#this_is_my_var_this_is_my_gun = some_method
puts this_is_my_var_this_is_my_gun
#puts this_is_not_my_var_nor_is_it_my_gun

