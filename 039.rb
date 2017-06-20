#!/usr/bin/env ruby

require 'set'

LIMIT = 1_000

solutions = Hash.new { |hash, key| hash[key] = Set.new }
(1..31).each do |n| # floor of square root of limit
  ((n + 1)..LIMIT).each do |m|
    # https://en.wikipedia.org/wiki/Pythagorean_triple#Generating_a_triple
    base_a = m**2 - n**2
    base_b = 2 * m * n
    base_c = m**2 + n**2

    break if [base_a, base_b, base_c].reduce(&:+) > LIMIT
#    puts "#{base_a} #{base_b} #{base_c}"

    (1..LIMIT).each do |k|
      a = base_a * k
      b = base_b * k
      c = base_c * k


      perimeter = [a, b, c].reduce(&:+)
      break if perimeter > LIMIT

      solutions[perimeter]
      solutions[perimeter] << [a, b, c]
    end
  end
end

max_key = 0
max_value = 0

solutions.each do |key, value|
  if value.count > max_value
    max_key = key
    max_value = value.count
  end
end

puts max_key
