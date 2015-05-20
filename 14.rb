def collatzer num
  ctr = 1
  until num == 1 do
    if num % 2 == 0
      num = num / 2
    else
      num = (3 * num) + 1
    end
    ctr+=1
  end
  return ctr
end

cn = 0
cl = 0
(1..1_000_000).to_a.each do |n|
  if (l = collatzer(n)) > cl
    cn = n
    cl = l
  end
end

puts cn