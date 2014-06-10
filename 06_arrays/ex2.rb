#ex2.rb

arr = ["b", "a"]
arr = arr.product(Array(1..3)) 
#arr == [[b,1], [b,2], [b,3], [a,1], [a,2], [a,3]]
arr.first.delete(arr.first.last) 
#arr == [[b], [b,2], [b,3], [a,1], [a,2], [a,3]]
#returns 1, because that is the value of what delete removed.
#puts arr.to_s

arr = ["b", "a"]
arr = arr.product([Array(1..3)])
#[b, a] * [[1, 2, 3]] = [[b, [1, 2, 3]], [a, [1, 2, 3]]]
arr.first.delete(arr.first.last) 
#arr = [[b], [a, [1, 2, 3]]]
#returns [1, 2, 3] because that's what delete removed.
#puts arr.to_s
