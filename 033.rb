#!/usr/bin/env ruby

require 'prime'

fractions = []

(1..8).each do |numerator|
  ((numerator + 1)..9).each do |denominator|
    fraction = numerator.to_f / denominator.to_f

    (1..9).each do |digit|
      [digit * 10 + denominator, denominator * 10 + digit].each do |special_denominator|
        special_numerator = special_denominator * fraction

        next unless special_numerator % 1 == 0
        next if special_numerator % 10 == 0 && special_denominator % 10 == 0

        special_numerator = special_numerator.to_i

        if [digit * 10 + numerator, numerator * 10 + digit].include?(special_numerator)
          if special_numerator.to_f / special_denominator.to_f == fraction
            fractions << [numerator, denominator]
          end
        end
      end
    end
  end
end

numerator, denominator = fractions.reduce([1, 1]) { |product, fraction| [product[0] * fraction[0], product[1] * fraction[1]] }
common_factors = numerator.prime_division.map(&:first) & denominator.prime_division.map(&:first)

until common_factors.empty?
  common_factors.each do |factor|
    numerator /= factor
    denominator /= factor
  end

  common_factors = numerator.prime_division.map(&:first) & denominator.prime_division.map(&:first)
end

puts denominator
