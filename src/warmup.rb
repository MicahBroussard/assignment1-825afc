# Returns the first n Fibonacci numbers as an array.
#
# @param n [Integer] the number of Fibonacci terms to generate
# @return [Array<Integer>] the sequence of Fibonacci numbers
def fib(n)
  return [] if n == 0
  return [0] if n == 1

  s = [0, 1]
  (n - 2).times do
    s << s[-1] + s[-2]   # append sum of last two elements
  end
  s
end

# Checks if an integer is a palindrome.
#
# @param n [Integer] the number to check
# @return [Boolean] true if n is a palindrome, false otherwise
def isPalindrome(n)
  p = n.to_s
  p == p.reverse
end

# Returns the nth largest element in an array.
#
# @param n [Integer] index of the element in descending order (0 = max)
# @param a [Array<Integer>] the array of integers
# @return [Integer, nil] the nth largest element, or nil if out of range
def nthmax(n, a)
  s = a.sort.reverse
  return nil if n >= s.length
  s[n]
end

# Finds the most frequent character in a string.
#
# @param s [String] the input string
# @return [String] the most frequent character,
#   or an empty string if the input is empty
def freq(s)
  return "" if s.empty?

  counts = Hash.new(0)
  s.each_char {|ch| counts[ch] += 1}
  counts.max_by {|_, count| count}[0]
end

# Zips two arrays into a hash mapping arr1[i] => arr2[i].
#
# @param arr1 [Array] the array of keys
# @param arr2 [Array] the array of values
# @return [Hash, nil] hash mapping arr1 to arr2, or nil if arrays differ in length
def zipHash(arr1, arr2)
  return nil if arr1.length != arr2.length
  Hash[arr1.zip(arr2)]
end

# Converts a hash into an array of [key, value] pairs.
#
# @param hash [Hash] the input hash
# @return [Array<Array>] array of [key, value] pairs in the order of hash.keys
def hashToArray(hash)
  hash.keys.map {|k| [k, hash[k]]}
end
