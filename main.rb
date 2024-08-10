require './lib/tree_class'

tree=BinaryTree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
tree.insert(69)
tree.pretty_print

tree.delete(67)
puts 
puts 
puts 
tree.pretty_print