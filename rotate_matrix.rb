# given a matrix, rotate it 90 degrees

# I really don't remember this approach

# Solution 1
#
def rotateMatrix(mat)
      n = mat.size
    # Consider all squares one by one 
  0.upto(n/2) do |x|
        
      # Consider elements in group    
      # of 4 in current square 
    x.upto(n-x-1) do |y|
          
        # store current cell in temp variable 
      temp = mat[x][y] 

      # move values from right to top 
      mat[x][y] = mat[y][n-1-x]

      # move values from bottom to right 
      mat[y][n-1-x] = mat[n-1-x][n-1-y] 

      # move values from left to bottom 
      mat[n-1-x][n-1-y] = mat[n-1-y][x] 

      # assign temp to left 
      mat[n-1-y][x] = temp 
    end
  end
  mat
end

# this is actually the important algorithm for rotating a matrix 90 degrees
#
def rotate(x, y, n)
  [y, n-1-x]
end

# Solution 2
#
# Rotation of matrix by 90 degree without using extra space 
# 
# After transpose we swap elements of column 
# one by one for finding left rotation of matrix 
# by 90 degree 
#
# If rotation is to the right, reverse rows instead
#
def reverse_columns(arr) 
  0.upto(arr[0].size-1) do |i|
    j = 0
    k = arr[0].size-1
    while j < k
      t = arr[j][i] 
      arr[j][i] = arr[k][i] 
      arr[k][i] = t 
      j += 1
      k -= 1
    end
  end
  arr
end

def reverse_rows(arr) 
  0.upto(arr.size-1) do |i|
    j = 0
    k = arr.size-1
    while j < k
      t = arr[i][j] 
      arr[i][j] = arr[i][k] 
      arr[i][k] = t 
      j += 1
      k -= 1
    end
  end
  arr
end
    
# Function for do transpose of matrix 
def transpose(arr)
  arr2 = Array.new(arr[0].size) { Array.new(arr.size, 0)}
  0.upto(arr.size - 1) do |i| 
    i.upto(arr[0].size - 1) do |j|
      t = arr[i][j] 
      arr[i][j] = arr[j][i] 
      arr[j][i] = t
    end
  end
  arr
end

