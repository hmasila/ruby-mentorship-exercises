def min_value(arr, k)
  arr.each |hash|
    hash.keys
end


arr = [ {"a"=>3, "b"=>2 }, {"a"=> 2, "b" => 4 }, {"a"=>6, "b"=>1 }]
#p min_value(arr, "b")
i=0
arr.select { |k| i = k["b"] if i > k["b"]}

require 'json'
require 'net/http'
require 'uri'
require 'rails'

def requests
  file = File.read("rails.json")
  JSON.parse(file)
end

def run_requests
  requests.each do |request|
    make_request(request["url"], request["verb"], request["body"])
  end
end

def make_request(url, http_method, params=nil)
  uri = URI.parse(url)
  http = Net::HTTP.new(uri.host, uri.port)

  http.use_ssl = (uri.scheme == "https")

  req = "Net::HTTP::#{http_method.capitalize}".constantize.new(uri)
  req.basic_auth(ENV["G_USERNAME"], ENV["G_PASSWORD"])

  req.body = params.to_json if params
  res = http.request(req)
  p JSON.parse(res.body)
end

# def all_fib(n)
#   memo = Hash[(1..n+1).map { |v| [v, 0] }]
#   1.upto(n) do |i|
#     memo = fib(i, memo)
#     p "#{i}: #{memo}"
#   end
#   p memo
# end

def even_fibonacci_numbers(n)
  memo = Hash[(1..n+1).map { |v| [v, 0] }]
  sum = 0
  1.upto(n) do |i|
    memo = fib(i, memo)
    sum += memo if memo.even?
  end
   p sum
end

def all_fib(n)
  memo = 0
  1.upto(n) do |i|
    memo = fib(i, memo)
  end
  p memo
end

def fib(n, memo)
  if(n <= 0)
    return 0
  elsif(n==1)
    return 1
  end
  fib(n-1, memo) + fib(n-2, memo)
end


# def fib(n, memo)
#   if(n <= 0)
#     return 0
#   elsif(n==1)
#     return 1
#   elsif memo[n] != 0
#     return memo
#   end
#   fib(n-1, memo) + fib(n-2, memo)
# end

def even_fibonacci_number(n)
  sum = 0
  fib1 = 0
  fib2 = 1
  while fib2 < n
    temp = fib1
    fib1 = fib2
    fib2+=temp
    sum += fib2 if fib2.even?
  end
   p sum
end

def root(x, n)
  1.upto(n-1) do
    p x
    x = Math.sqrt(x)
  end
  p x
end

class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

def longest_non_repeating_substring(s)
  return 0 if s.length == 0
  h = {}
  max = 0
  start = 0

  0.upto(s.length - 1) do |i|
    c = s[i]
    if h.key? c
      start = [start, h[c] + 1].max
    end
    h[c] = i
    max = [max, i-start+1].max
  end
  max
end

longest_non_repeating_substring("aaaacbbbb")

def equal_sums(n)
  h = Hash.new { |hash, key| hash[key] = [] }
  1.upto(n) do |i|
    1.upto(n) do |j|
      sum = i**3 + j**3
      h[sum] << [i, j]
    end
  end
  h.each do |k, v|
    if h[k].flatten!.uniq!.size > 2
      p h[k].join(',')
    end
  end
end

def anagram_search(s1, s2)
  h = Hash.new { |hash, key| hash[key] = 0 }
  count = 0
  len = s1.length
  s1.chars.each { |c| h[c] += 1}

  s2.each_char.with_index do |c, i|
    h.key? c
    if h.key? c && h[c] >= 1
      len -= 1
      h[c] -= 1
      i += 1
      len
    end

    if (len == 0)
      count += 1
    end
  end
  count
end

anagram_search("abc", "cbaebabacd")
# class Solution:
#     def addTwoNumbers(self, l1, l2):
#         carry = 0
#         dummyhead = ListNode(0)
#         node = dummyhead
#         while l1 is not None or l2 is not None:
#             _sum = (l1 and l1.val or 0) + (l2 and l2.val or 0) + carry
#             carry = _sum // 10
#             node.next = ListNode(_sum%10)
#             node = node.next
#             l1 = l1 and l1.next
#             l2 = l2 and l2.next
#         if carry == 1: node.next = ListNode(1)
#         return dummyhead.next

[2,4,3]
[5,6,4]


def levenshtein_distancey(s, t)
  m = s.length
  n = t.length
  return m if n == 0
  return n if m == 0
  d = Array.new(m+1) { Array.new(n+1, 0) }
  
  (1..m).each do |i|
    (1..n).each do |j|
      if i == 0
        d[i][j] = j
      elsif j == 0
        d[i][j] = i
      elsif s[i-1] == t[j-1]  # adjust index into string
        d[i][j] = d[i-1][j-1]       # no operation required
      else
        1 + [ d[i-1][j],    # deletion
              d[i][j-1],    # insertion
            ].min
      end
    end
  end
  d[m][n]
end

def levenshtein_distance(str1, str2)
  n = str1.length
  m = str2.length
  max = n/2
 
  return m if 0 == n
  return n if 0 == m
  return n if (n - m).abs > max
 
  d = (0..m).to_a
  x = nil
 
  str1.each_char.with_index do |char1,i|
    e = i+1
 
    str2.each_char.with_index do |char2,j|
      if char1 == char2
        x = e
        d[j] = e
        e = x
      else
      
        x = [ d[j+1] + 1, # insertion
              e + 1     # deletion
            ].min
        d[j] = e
        e = x
      end
    end
 
    d[m] = x
  end
 
  x
end

def distance(a, b)
  costs = Array(0..b.length) # i == 0
  (1..a.length).each do |i|
    costs[0] = i  # j == 0; nw is lev(i-1, j)
    (1..b.length).each do |j|
      if a[i - 1] == b[j - 1]
        costs[j] = i - 1
      else
        costs[j] = [costs[j] + 1, costs[j-1] + 1].min
      end
    end
  end
  costs[b.length]
end

p distance("some", "mose")
l1 = ListNode.new(2)
l1.next = ListNode.new(4)
l1.next.next = ListNode.new(3)

l2 = ListNode.new(5)
l2.next = ListNode.new(6)
l2.next.next = ListNode.new(4)
l2.next.next.next = ListNode.new(0)

# p add_two_numbers(l1, l2)