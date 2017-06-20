#!/usr/bin/env ruby

LIMIT = 1_000_000

d = ''
i = 0

while d.length < LIMIT
  d << (i += 1).to_s
end

puts [d[0], d[9], d[99], d[999], d[9999], d[99999], d[999999]].map(&:to_i).reduce(&:*)