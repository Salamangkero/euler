#The prime factors of 13195 are 5, 7, 13 and 29.
#What is the largest prime factor of the number 600851475143 ?
require 'prime'
#big_num = 600851475143
#num = 1
#current_prime = 0
#while (num <= big_num) do
#  if Prime.prime?(num)
#    if (big_num % num == 0)
#      current_prime = num
#      big_num = big_num / num
#    end
#  end
#  num+=1
#end
#
puts 600851475143.prime_division.flatten.max
