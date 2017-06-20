#!/usr/bin/env ruby

AMOUNT = 200

DENOMINATIONS = [1, 2, 5, 10, 20, 50, 100].reverse

def dfs(combo_count, coinsworth, coin)
  coinsworth += coin
  if coinsworth == AMOUNT
    return combo_count + 1
  elsif coinsworth > AMOUNT
    return combo_count
  end

  DENOMINATIONS.each do |denomination|
    next if coin > 0 && denomination > coin
    combo_count = dfs(combo_count, coinsworth, denomination)
  end

  combo_count
end

puts dfs(0, 0, 0) + 1
