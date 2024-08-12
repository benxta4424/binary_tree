require './lib/node'
class BinaryTree
    attr_accessor :root
    def initialize(array)
        @root=build_tree(array.uniq.sort)
    end
    
    def build_tree(array)
        return nil if array.empty?

        middle=(array.size-1)/2

        root=Node.new(array[middle])
        root.left = build_tree(array[0...middle])
        root.right = build_tree(array[middle+1..-1])

        return root
    end

    def insert(value,current_root=@root)
        return Node.new(value) if current_root.nil?

        if current_root.data<value
            current_root.right = insert(value,current_root.right)
        elsif current_root.data>value
            current_root.left = insert(value,current_root.left)
        end

        return current_root
    end

    def delete(value,current_root=@root)
        return current_root if current_root.nil?

        if current_root.data>value
            current_root.left=delete(value,current_root.left)
        elsif current_root.data<value
            current_root.right=delete(value,current_root)
        else
            if current_root.left.nil?
                return current_root.right
            end

            if current_root.right.nil?
                return current_root.left
            end
        
            succesor=get_succesor(current_root)
            current_root.data=succesor.data
            current_root.right=delete(succesor.data,current_root.right)
        end

        return current_root
    end
    
    def get_succesor(current_root=@root)
        current_root=current_root.right

        while !current_root.nil? && !current_root.left.nil?
            current_root=current_root.left
        end

        current_root
    end

    def find(value,current_root=@root)
        return current_root if current_root.nil? || current_root.data == value

        if current_root.data<value
            find(value,current_root.right)
        elsif current_root.data>value
            find(value,current_root.left)
        end
    end

    def inorder(current_root=root,results=[])
        return results if current_root.nil?

        inorder(current_root.left,results)
        results<<current_root.data
        inorder(current_root.right,results)

        results

    end

    def preorder(current_root=@root)
        return nil if current_root.nil?

        print current_root.data.to_s+' '
        preorder(current_root.left)
        preorder(current_root.right)
    end

    def postorder(current_node=@root)
        return nil if current_node.nil?

        postorder(current_node.left)
        postorder(current_node.right)
        print current_node.data.to_s+' '
    end

    def height(node)
        if node.nil?
            return 0
        else
            right_height=height(node.right)
            left_height=height(node.left)

            if left_height>right_height
                return left_height+=1
            else
                return right_height+=1
            end
        end


    end

    def depth(current_root=@root,value)
        node=find(value)
        node_value=node.data

        queue=[@root]
        result=-1

        while queue.size.positive?
            current=queue.shift
            result+=1
            if current.data == node_value
                break
            elsif current.data<value
                queue<<current.right
            elsif current.data>value
                queue<<current.left
            end
            
        end

        puts result
    end

    def balanced?(current_root=@root)
        lefts=current_root.left
        rights=current_root.right

        if height(lefts)>=height(rights)+2
            puts "The tree is unbalanced on the left sub-tree of root brev!"
        elsif height(lefts)+2<=height(rights)
            puts "The tree is unbalanced on the right sub-tree of root brev!"
        end
    end

    def rebalance(current_root=@root)
        @root=build_tree(inorder)
        
        pretty_print
    end

    def pretty_print(node = @root, prefix = '', is_left = true)
        pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
        puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
        pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
    end
     

end