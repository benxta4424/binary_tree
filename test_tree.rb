require './lib/tree_class'

new_tree_values=Array.new(15){rand(1..100)}

new_tree_values=new_tree_values.uniq.sort

test=BinaryTree.new(new_tree_values)

test.pretty_print

test.balanced?

puts
puts 'preorder'

test.preorder


puts
puts 'postorder'

test.postorder

puts
puts 'inorder'

puts test.inorder.join(' ')

5.times do
    random_number=rand(100...999)

    test.insert(random_number)
end

test.pretty_print
puts
test.balanced?
puts
test.rebalance
puts
test.balanced?

puts
puts 'preorder'

test.preorder


puts
puts 'postorder'

test.postorder

puts
puts 'inorder'

puts test.inorder.join(' ')