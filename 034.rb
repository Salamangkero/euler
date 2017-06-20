#!/usr/bin/env ruby

LIMIT = 99_999

factorials = [1]
(1..9).each { |digit| factorials << (1..digit).reduce(&:*) }

result = (3..LIMIT).reduce(0) do |sum, number|
  print '.' if number % 100_000 == 0
  number.to_s.split('').map(&:to_i).map { |digit| factorials[digit] }.reduce(&:+) == number ? sum + number : sum
end

puts result
