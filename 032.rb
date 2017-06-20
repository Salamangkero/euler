#!/usr/bin/env ruby

require 'set'

# Assume that we're looking for either ?? * ??? = ???? or ? * ???? = ????
def dfs(products, factors, first_length, last_length, digits)
  if factors.count == first_length + last_length
    product = factors.first(first_length).join.to_i * factors.last(last_length).join.to_i
    products << product if product.to_s.length == digits.count && (digits - product.to_s.split('')).empty?
  else
    digits.each do |digit|
      products = dfs(products, factors + [digit], first_length, last_length, digits - [digit])
    end
  end

  products
end

products = Set.new
products = dfs(products, [], 1, 4, %w(1 2 3 4 5 6 7 8 9))
products = dfs(products, [], 2, 3, %w(1 2 3 4 5 6 7 8 9))

puts products.reduce(&:+)
