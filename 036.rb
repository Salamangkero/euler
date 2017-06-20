#!/usr/bin/env ruby

LIMIT = 999_999

sum = 0
(1..LIMIT).each do |number|
  base2 = number.to_s(2)
  base10 = number.to_s

  sum += number if base2 == base2.reverse && base10 == base10.reverse
end

puts sum
