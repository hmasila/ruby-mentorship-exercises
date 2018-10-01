# Given a tree, can you determine if it is bst or not?
#
# Remember all bst are binary trees but not all binary trees are bst
#
# A binary search tree (BST) is a node based binary tree data structure which has the following properties.
# The left subtree of a node contains only nodes with keys less than the node’s key.
# The right subtree of a node contains only nodes with keys greater than the node’s key.
# Both the left and right subtrees must also be binary search trees.
#
class Node
  attr_accessor :value, :left, :right
  def initialize(value) 
    @value = value  
    @left = nil
    @right = nil
  end
end

def is_bst(node, lower_limit=nil, upper_limit=nil)
  if node.nil?
    return true
  end
  
  if !upper_limit.nil? && upper_limit<node.value
    return false
  end

  if !lower_limit.nil? && lower_limit>node.value
    return false
  end

  (is_bst(node.left, lower_limit, node.value) && is_bst(node.right, node.value, upper_limit))
end

root = Node.new(4) 
root.left = Node.new(2) 
root.right = Node.new(5) 
root.left.left = Node.new(1) 
root.left.right = Node.new(3) 

p is_bst(root) 