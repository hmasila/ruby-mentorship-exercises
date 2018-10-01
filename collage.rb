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


c,s="0:00 0:01".split(" ")
f=->(i) {i.split(":").map(&:to_i)}

d=f[c]
e=f[s]
y=e[1]-d[1]
z=e[0]-d[0]
if y<0
    y+=60
    z-=1
end
h = {}
h["s0"] = "00"
h["e0"] = "01"


h["s0"] = "59"
h["e1"] = "01"

start, finish = "0:59 1:01".split(" ")
h1, m1 = start.split(":").map(&:to_i)
h2, m2 = finish.split(":").map(&:to_i)

if m1 > m2
  m2 += 60
  h2 -= 1
end

rh = h2 - h1
rm = m2 - m1 < 10 ? "0#{m2 - m1}" : m2 - m1

res = [rh, rm].join(":")
