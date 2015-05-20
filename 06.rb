#The sum of the squares of the first ten natural numbers is,
#
#1^2 + 2^2 + ... + 10^2 = 385
#The square of the sum of the first ten natural numbers is,
#
#(1 + 2 + ... + 10)^2 = 55^2 = 3025
#Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.
#
#Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

sum_square = 0
sum_nat = 0

# 0 is a natural number 0-99 first 100.

100.times do |i|
 num = (i + 1)
 sum_square += num **2
 sum_nat += num
end

puts (sum_nat **2) - sum_square