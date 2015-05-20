#A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
#
#a^2 + b^2 = c^2
#For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
#
#There exists exactly one Pythagorean triplet for which a + b + c = 1000.
#Find the product abc.

n = 1000

# a + b + c = 1000
# a < b < c

#c = 1000 - a - b

# a^2 + b^2 = c ^2

1.upto(n).each do |b|
  1.upto(n-b).each do |a|
    c = n-b-a
    puts "a:#{a} b:#{b} c:#{c} = #{a*b*c}" if (a**2+b**2==c**2) and (a<b and b<c)
  end
end
#


