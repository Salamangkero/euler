#2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
#What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

#def divisible_by_min_to_max num, min ,max
#  sentinel = true
#  (min..max).to_a.each do |i|
#    return false if num % i != 0
#  end
#  sentinel
#end
#
#num = 20
#until divisible_by_min_to_max(num,11,20) do
#  num+=20
#  puts num
#end
#
#puts num

puts 1.upto(20).inject {|result, n| result.lcm(n)}
