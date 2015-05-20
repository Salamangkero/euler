#The Fibonacci sequence is defined by the recurrence relation:
#
#Fn = Fn−1 + Fn−2, where F1 = 1 and F2 = 1.
#Hence the first 12 terms will be:
#
#F1 = 1
#F2 = 1
#F3 = 2
#F4 = 3
#F5 = 5
#F6 = 8
#F7 = 13
#F8 = 21
#F9 = 34
#F10 = 55
#F11 = 89
#F12 = 144
#The 12th term, F12, is the first term to contain three digits.

n1 = 1
n2 = 2
nn = 1
ctr = 3
sum = 2
until (c = (Math.log10(nn) + 1).to_i) == 1_000 do
  nn = n1 + n2
  ctr += 1
  sum += nn if(nn % 2 == 0)
  n1 = n2
  n2 = nn
end


puts ctr