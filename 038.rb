#!/usr/bin/env ruby

def is_concatenated_product?(number)
  (0..3).each do |digits|
    base = number[0..digits].to_i
    concats = ''
    multiple = 1

    while concats.length < number.length do
      concats << (base * multiple).to_s
      multiple += 1
    end

    return true if concats == number
  end

  false
end

def dfs(number, remaining_digits)
  if remaining_digits.empty?
    number = number.join
    return number if is_concatenated_product?(number)
  else
    remaining_digits.each do |digit|
      max_pandigital = dfs(number + [digit], remaining_digits - [digit])
      return max_pandigital if max_pandigital
    end
  end

  false
end

puts dfs([], %w(9 8 7 6 5 4 3 2 1))
