# Given a factor n, rotate the array by that factor
#
# [1, 2, 3, 4, 5, 6, 7] by 2 => [3, 4, 5, 6, 7, 1, 2]
#
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