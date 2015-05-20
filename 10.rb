#The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
#
#Find the sum of all the primes below two million.

require 'prime'

#sum = 0
#num = 0
#prime = 0
#while prime <= 2000000 do
#  if Prime.prime? num
#    prime = num
#    if prime <= 2000000
#      sum += prime
#    end
#  end
#  num+=1
#end
#
#
sum = 0
Prime.each do |p|
  break if p > 2_000_000
  sum+=p
end

puts sum