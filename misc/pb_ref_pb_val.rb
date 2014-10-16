#pb_ref_pb_val.rb

def take_array(array)
  array.uniq
end

the_array = [1,1,1,2,3,4,4,5,6,7,7]

the_array = take_array(the_array)

p the_array