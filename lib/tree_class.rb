require './lib/node' 

class BinaryTree
    attr_accessor :array,:root

    def initialize(array)
        @sorted_array=array.uniq.sort
        @tree=build_tree(@sorted_array)
    end

    def build_tree(array)
        return nil if array.empty?

        middle=(array.size-1)/2
        root_node=Node.new(array[middle])
        root_node.left = build_tree(array[0...middle])
        root_node.right = build_tree(array[(middle+1)..-1])

        return root_node
    end

    def insert(value,current_root=@tree)
        return Node.new(value) if current_root.nil?

        if current_root.data>value
            current_root.left=insert(value,current_root.left)
        elsif current_root.data<value
            current_root.right=insert(value,current_root.right)
        end

        return current_root
    end

    def delete(value,current_node=@tree)
        return nil if current_node.nil?

        if current_node.data>value
            current_node.left=delete(value,current_node.left)
        elsif current_node.data<value
            current_node.right=delete(value,current_node.right)
        else
            if current_node.left.nil?
                return current_node.right
            end

            if current_node.right.nil?
                return current_node.left
            end

            next_smallest=succesor(current_node.right)
            current_node.data=next_smallest.data
            current_node.right=delete(next_smallest.data,current_node.right)
        end
        return current_node


    end

    def succesor(current_node=@tree)
        while current_node.left
            current_node=current_node.left
        end

        return current_node
    end

    def find_value(value,current_node=@tree,counter=0)

        return nil if current_node.data.nil?
        
        if current_node.data == value 
            return true
        else
            return nil
        end

        return nil if current_node.nil?

        if value<current_node.data
            current_node.left = find_value(value,current_node.left)
        elsif value>current_node.data
            current_node.right = find_value(value,current_node.right)
        end

        return current_node

    end

    def pretty_print(node = @tree, prefix = '', is_left = true)
        pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
        puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
        pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
      end
     
end