#!/usr/bin/env ruby

require 'prime'

base_array = %w(9 8 7 6 5 4 3 2 1)

max_prime = 0
while base_array.count > 1
  base_array.permutation.each do |permutation|
    next if %w(2 4 5 6 8).include?(permutation.last)
    i = permutation.join.to_i

    if Prime.prime?(i)
      max_prime = i if i > max_prime
      break
    end
  end

  base_array.shift
end

puts max_prime