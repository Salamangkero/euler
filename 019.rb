#!/usr/bin/env ruby

require 'date'

LIMIT = 2000

sunday = Date.new(1901, 1, 6)
count = 0

begin
  count += 1 if sunday.day == 1
  sunday = sunday.next_day(7)
end until sunday.year > LIMIT

puts count
