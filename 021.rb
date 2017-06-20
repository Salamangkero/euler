#Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
#If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and each of a and b are called amicable numbers.
#
#For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.
#
#Evaluate the sum of all the amicable numbers under 10000.


require 'prime'
require 'pry'


NUM = 10_000
#factors are divisers?
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

def process_amicable(n, arr)
  n2 = d(n)
  return arr if arr.index(n2)
  if n == d(n2) and (n < NUM and n2 < NUM) and n != n2
    puts "#{n} and #{n2}"
    arr.push(n)
    arr.push(n2)
  end
  return arr
end
arr = []

NUM.times do |i|
  arr = process_amicable(i+1,arr)
end

puts arr.inject(:+)
