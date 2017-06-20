#!/usr/bin/env ruby

base_array = %w(9 8 7 6 5 4 3 2 1 0)

sum = 0

base_array.permutation.each do |permutation|
  break if permutation.first == '0'

  next if permutation[1..3].join.to_i % 2 != 0
  next if permutation[2..4].join.to_i % 3 != 0
  next if permutation[3..5].join.to_i % 5 != 0
  next if permutation[4..6].join.to_i % 7 != 0
  next if permutation[5..7].join.to_i % 11 != 0
  next if permutation[6..8].join.to_i % 13 != 0
  next if permutation[7..9].join.to_i % 17 != 0
  sum += permutation.join.to_i
end

puts sum
