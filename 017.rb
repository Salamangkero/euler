#!/usr/bin/env ruby

require 'humanize'

LIMIT = 1000

letter_count = 0

(1..LIMIT).each { |n| letter_count += n.humanize.gsub(/[ -]/, '').length }

puts letter_count
