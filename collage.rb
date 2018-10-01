def two_sum(nums, target)
    other = {}
    0.upto(nums.size - 1) do |i|
        if other.key? nums[i]
            return [other[nums[i]], i]
        end
        other[target - nums[i]] = i
    end
end

two_sum([ 11, 15, 2, 7], 9)

def sample (*test)
   puts "The number of parameters is #{test.length}"
   for i in test
      puts i
   end
end

class Human
	attr_accessor :color
	alias :complexion :color
	
	def intialize(color)
		@color = color
	end
end

class Boy < Human
	def initialize(color, size)
		@size = size
		@color = color
	end

	def color
		"#{@size} #{@color}"
	end
end


def pretty_print(n)
  n.downto(1) do |i|
    res = (1..i).to_a.join
   if i.even?
     puts res
   else
     puts res.reverse
   end
  end
end


