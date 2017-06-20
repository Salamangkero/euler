#A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
#Find the largest palindrome made from the product of two 3-digit numbers.
# because

#largest product using 2 3digit numbers is 998001, which is 6 digits

def palindrome?(num)
  s = 0
  st = num.to_s
  l = st.length
  return false if !(l % 2 == 0)
  sentinel = true
  (l/2).times do |i|
    count = i+1
    c = count-1
    e = l-count
    sentinel = false if st[c] != st[e]
  end
  return sentinel
end


current_palindrome = 0
n1 = 100

while n1 <= 999 do
  n2 = 100
  while n2 <= 999 do
    prod = n1 * n2
    if prod.to_s.length == 6
      current_palindrome = prod if palindrome?(prod) and prod > current_palindrome
    end
    n2+=1
  end
  n1+=1
end



puts current_palindrome
