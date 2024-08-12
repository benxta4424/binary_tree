require "./lib/tree_class"

tree = BinaryTree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
tree.insert(69)
tree.pretty_print

tree.delete(8)
puts
puts
puts
tree.pretty_print

if tree.find_value(69)
  puts "the valus is in the tree"
else
  puts "the value is not in the tree"
end

if tree.find_value(342_342)
  puts "the valus is in the tree"
else
  puts "the value is not in the tree"
end

puts tree.level_order

puts tree.preorder.join(' ')

puts tree.inorder.join(' ')

puts tree.postorder.join(' ')
