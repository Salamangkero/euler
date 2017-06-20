#!/usr/bin/env ruby

# f(x) = x^2 + ax + b
# f(0) = b; b needs to be prime and positive
# f(1) = 1 + a + b; unless b = 2, |a| < b && a needs to be odd

require 'prime'

LIMIT = 1_000

def prime_length(a, b)
  prime = n = 0

  begin
    n += 1
    prime = n**2 + a*n + b
  end while prime.prime?

  n
end

product = max_prime_length = 0

Prime.each(LIMIT) do |b|
  next if b == 2

  (-(b-2)..(b-2)).each do |a|
    current_prime_length = prime_length(a, b)
    if current_prime_length > max_prime_length
      max_prime_length = current_prime_length
      product = a * b
    end
  end
end

puts product
