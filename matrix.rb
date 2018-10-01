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

def rotate(x, y, n)
  [y, n-1-x]
end

# Python 3 program for left rotation of matrix by 90 
# degree without using extra space 
   
# After transpose we swap elements of column 
# one by one for finding left rotation of matrix 
# by 90 degree 
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

# this is normal array rotation not matrix
def rotate(arr, n)
    curr_i = new_i = 0
    temp = new_val = arr[curr_i]; 
    i = 0
    while (i < arr.length)
        curr_i = new_i

        #compute the new index for current value 
        new_i = (arr.length - (n % arr.length) + curr_i) % arr.length; 

        #take backup of new index value 
        temp = arr[new_i]

        #assign the value to the new index 
        arr[new_i] = new_val 

        new_val = temp
        i+=1
    end
    arr
end


p rotate([1, 2, 3, 4, 5, 6, 7], 2)
