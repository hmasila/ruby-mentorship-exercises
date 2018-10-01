# Given a binary tree, find the least common ancestor of given two nodes
#
class Node
  attr_accessor :key, :left, :right
  def initialize(value) 
    @key = value  
    @left = nil
    @right = nil
  end
end

def findLCA(root, n1, n2)  
  # Base Case 
  if root.nil? 
    return nil
  end

  # If either n1 or n2 matches with root's key, report 
  #  the presence by returning root (Note that if a key is 
  #  ancestor of other, then the ancestor key becomes LCA 
  if root.key == n1 or root.key == n2
    return root
  end  

  # Look for keys in left and right subtrees 
  left_lca = findLCA(root.left, n1, n2)  
  right_lca = findLCA(root.right, n1, n2) 

  # If both of the above calls return Non-NULL, then one key 
  # is present in once subtree and other is present in other, 
  # So this node is the LCA 
  if left_lca and right_lca 
    return root
  end

  # Otherwise check if left subtree or right subtree is LCA 
  return !left_lca.nil? ? left_lca : right_lca
end

  
# Let us create a binary tree given in the above example 
root = Node.new(1) 
root.left = Node.new(2) 
root.right = Node.new(3) 
root.left.left = Node.new(4) 
root.left.right = Node.new(5) 
root.right.left = Node.new(6) 
root.right.right = Node.new(7) 

print "LCA(4,5) = ", findLCA(root, 4, 5).key 
print "LCA(4,6) = ", findLCA(root, 4, 6).key 
print "LCA(3,4) = ", findLCA(root, 3, 4).key 
print "LCA(2,4) = ", findLCA(root, 2, 4).key 