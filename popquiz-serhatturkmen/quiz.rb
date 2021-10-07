array1 = [10, 20, 30, 40, 10, 10, 20]
array2 = [10, 10, 10]

puts "Original array:"
p array1
puts "Is all items are identical?"
puts array1.uniq.length == 1

puts "Original array:"
p array2
puts "Is all items are identical?"
puts array2.uniq.length == 1
