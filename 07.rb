
#By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
#
#What is the 10 001st prime number?
require 'prime'

ctr = 0
num = 0
current_prime = 0
while ctr <= 10000 do
  if Prime.prime? num
    current_prime = num
    ctr += 1
  end
  num += 1
end

puts current_prime