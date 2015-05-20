#A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.
#
#A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum exceeds n.
#
#As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of two abundant numbers is 24. By mathematical analysis, it can be shown that all integers greater than 28123 can be written as the sum of two abundant numbers. However, this upper limit cannot be reduced any further by analysis even though it is known that the greatest number that cannot be expressed as the sum of two abundant numbers is less than this limit.
#
#Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.

require 'prime'
require 'pry'
a = Time.now
def d(number)
  return 0 if number == 0
  primes, powers = number.prime_division.transpose
  return 0 if !(primes and powers)
  exponents = powers.map{|i| (0..i).to_a}
  divisors = exponents.shift.product(*exponents).map do |powers|
    primes.zip(powers).map{|prime, power| prime ** power}.inject(:*)
  end
  divisors.sort.map{|div| [div, number / div] }.flatten.uniq.select{|i| i<number}.inject(:+)
end

def is_abundant?(number)
  d(number) > number
end

MAX = 28123
MIN = 1

abundant_array = []
(12..MAX).to_a.each do |n|
  abundant_array.push(n) if is_abundant?(n) #and d(n) < MAX
end
abundant_array = abundant_array.sort.reverse

arr = []
(MIN..MAX).to_a.each do |n|
  if !abundant_array.detect{|n2| n > n2 and is_abundant?(n - n2)}
    arr.push(n)
    puts n
  end
end

puts a
puts Time.now
puts arr.uniq.inject(:+)