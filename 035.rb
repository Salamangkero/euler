#!/usr/bin/env ruby

require 'prime'
require 'set'

def rotations(number)
  rotations = [number.to_s]

  (rotations[0].length - 1).times do
    rotation = "#{rotations[-1][1..-1]}#{rotations[-1][0]}"
    return [] unless Prime.prime?(rotation.to_i)
    rotations << rotation
  end

  rotations
end

LIMIT = 1_000_000

circular_primes = Set.new

Prime.each(LIMIT) do |prime|
  next if circular_primes.include?(prime)

  rotations(prime).each do |rotation|
    circular_primes << rotation.to_i
  end
end

puts circular_primes.count
