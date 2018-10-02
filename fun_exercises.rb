def sum_of_multiples
	sum = 0
	(0...10).each do |i|
		if (i % 3 == 0 || i % 5 == 0)
			sum += i
		end
	end
	p sum
end


def non_repeating_character(str)
	h = {}
	str.chars.each do |i|
		if h.key?(i)
			h[i] += 1
		else
			h[i] = 1
		end
	end
	h.key(1)
end
def even_fibonacci_numbers
	sum = 0
	fib1 = 0
	fib2 = 1
	while fib2 < 4_000_000
		temp = fib1
		fib1 = fib2
		fib2+=temp
		sum += fib2 if fib2.even?
	end
	 p sum
end

def is_prime(x)
	return true if x == 2
	return false if x < 2 || x % 2 == 0
	
	(3..(Math.sqrt(x).ceil)).step(2) do |i|
		return false if x % i == 0
	end
	true
end

def prime(x)
	primes = [2]
	(3..x).step(2) do |i|
		j = 0
		is_prime = true
		p i
		while primes[j] ** 2 <= i
			if i % primes[j] == 0
				is_prime = false
				break
			end
			j+=1
		end
		primes << i if is_prime
	end
	primes
end


"As a special case, for Fixnum and Bignum, it performs a bitwise left-shift of the twos-complement representation of the Integer"
def is_mersenne_prime ( p )
  return true  if p == 2
  m_p = ( 1 << p ) - 1
  s = 4
  (p-2).times do
   s = (s ** 2 - 2) % m_p 
   p s
  end
  s == 0
end

def is_palindrome(n)
    s = n.to_s
    s.reverse == s
end

def get_biggest_palindrome
    max_product = 0
    999.downto(99) do |i|
        if max_product >= 999*i
            # no need to iterate further down
            break
        end
        999.downto(i-1) do |j|
            prod = j * i
            if max_product >= prod
                # no need to iterate further down
                break
            end
            if is_palindrome(prod)
                max_product = prod
            end
        end
    end
    max_product
end
get_biggest_palindrome

def largest_prime_factor(num)
	max = 0
	(2..(Math.sqrt(num).ceil)).each do |i|
		if num % i == 0
			if is_prime(num/i)
				return num/i
			end
			if is_prime(i)
				max = i
			end
		end
	end
	max
end
largest_prime_factor(600851475143)


def fibonacci(n)
    a = 0
    b = 1

    # Compute Fibonacci number in the desired position.
    n.times do
        temp = a
        a = b
        # Add up previous two numbers in sequence.
        b = temp + b
    end

    return a
end

# Humanize the number
@n = 112
def suffix(n)
	h = {"1": "st", "2": "nd", "3": "rd"}
	if n.to_s.chars[-2] == "1"
	    r = "th"
	else
	    l = n.to_s.chars.last
	    r = h[l.to_sym]
	end
	"#{n}#{r}"
end


# TODO: this implementation is wrong
r = "VII"
def roman_to_numeric(r)
	h = {"I":1,"V":5,"X":10,"L":50,"C":100,"D":500,"M":1000,"IV":4,"IX":9,"XL":40,"XC":90,"CD":400,"CM":900}
	if h.key?(r.to_sym)
	    return h[r.to_sym]
	else
	    t=r.chars
	    for i in t
	        return h[i.to_sym]
	    end
	end
end

# someone wrote this and it works, but oh my, what is this supposed to mean

a={?M=>1000,?D=>500,?C=>100,?L=>50,?X=>10,?V=>5,?I=>1}
l=?I
p gets.chars.reverse.map{|x|y=a[x]*(a[l]>a[x]?-1:1);l=x;y}.sum

p roman_to_numeric(r)
