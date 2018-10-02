class Array
	def select
		ans = []
		for i in self
			ans << i if yield(i)
		end
		ans
	end

	def each
		for i in self
			yield(i)
		end
		self
	end

	def map
		ans = []
		for i in self
			ans	<< yield(i)
		end
		ans
	end

	def detect
		for i in self
			return i if yield(i)
		end
	end

	def ==(arr)
		return false if self.size != arr.size

		(0...self.size).each do |i|
			return false if self[i] != arr[i]
		end
		true
	end
end
