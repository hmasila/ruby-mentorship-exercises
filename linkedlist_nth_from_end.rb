# Given a linked list, can you find the nth element from the end
#
class Node 
  # Constructor to initialize the node object
  attr_accessor :data, :next 
  def initialize(data) 
    @data = data 
    @next = nil
  end
end
  
class LinkedList
  # Function to initialize head 
  def initialize 
    @head = nil
  end

  # Function to insert a new node at the beginning 
  def push(new_data)
    new_node = Node.new(new_data) 
    new_node.next = @head 
    @head = new_node
  end

  def print_nth_from_last(n)
    main_ptr = @head 
    ref_ptr = @head  
  
    if @head.nil?
      return "LinkedList cannot be nil"
    else
      count  = 0
      while(count < n ) 
        if(ref_ptr.nil?) 
          return "#{n} is greater than the no. of nodes in list"
        end

        ref_ptr = ref_ptr.next
        count += 1
      end
    end

    while(ref_ptr != nil)
      main_ptr = main_ptr.next 
      ref_ptr = ref_ptr.next
    end

    return "Node no. #{n} from last is #{main_ptr.data} "
  end
end
