#!/usr/bin/env ruby

LIMIT = 999_999 # trial-and-error; started at 99_999 ^_^
POWERS = (0..9).map { |n| n ** 5 }

# sum of fifth powers of digits
def sofpod?(number)
  number == number.to_s.split('').map(&:to_i).reduce(0) { |sum, digit| sum + POWERS[digit] }
end

sum_of_sofpods = 0
(10..LIMIT).each do |number|
  sum_of_sofpods += number if sofpod?(number)
end

puts sum_of_sofpods
