require "./lib/tree_class"

tree = BinaryTree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])

puts "The initial tree build"
puts
tree.pretty_print

tree.insert(69)
tree.insert(73)
tree.insert(74)
tree.insert(75)

puts
puts
puts

puts "The build after insertion"
puts
tree.pretty_print

puts
puts
puts

tree.delete(8)

puts "The build after deletion"
puts
tree.pretty_print

puts

if tree.find(69)
  puts "este in arbore"
else
  puts "nu este in arbore"
end

if tree.find(12_313)
  puts "este in arbore"
else
  puts "nu este in arbore"
end
puts
puts
puts "The build for inorder traversal"
puts tree.inorder.join(' ')

puts
puts
puts

puts "The build for preorder traversal"
tree.preorder

puts
puts
puts

puts "The build for postorder traversal"
tree.postorder

puts
puts
puts

puts "The height of the node"
print tree.height(tree.find(9)) - 1

puts
puts
puts

puts "The depth of the node"
print tree.depth(5)

puts
puts
puts

tree.balanced?

puts
puts
puts

tree.rebalance



puts
puts
puts
tree.balanced?