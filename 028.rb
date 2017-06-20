#Starting with the number 1 and moving to the right in a clockwise direction a 5 by 5 spiral is formed as follows:
#
#21 22 23 24 25
#20  7  8  9 10
#19  6  1  2 11
#18  5  4  3 12
#17 16 15 14 13
#
#It can be verified that the sum of the numbers on the diagonals is 101.
#
#What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral formed in the same way?




#number spiral

require 'pry'
NUM = 1001



num_array = [NUM]

NUM.times.each do |x|
  num_array[x] = []
  NUM.times.each do |y|
    num_array[x][y] = 0
  end
end

#check if NUM is odd or even for direction

is_odd = !(NUM % 2 == 0)
if is_odd
  x = NUM-1
  y = 0
  operator = 1
else
  x = 0
  y = NUM-1
  operator = -1
end

count = (NUM ** 2)
starter = false # true x, false y
num_array[x][y] = count

def compute_next(x,y,starter,operator)
  #puts "start computer #{x} #{y}"
  if starter
    y += operator
  else
    x += operator
  end
  #puts "end compute #{x} #{y}"
  return [x,y]
end

op_count = 0
until count == 1 do

  count-=1
  #puts "stasta #{x} #{y}"
  newx, newy = compute_next(x,y,starter,operator)
  cond = (newx >= 0 and newy >= 0 and newx < NUM and newy < NUM and num_array[newx][newy] == 0)
  #p "ss #{newx} #{newy}"

  if cond == true
    x = newx
    y = newy
  else
    puts (count + 1)
    if op_count == 1
      if operator == -1
        operator = 1
      else
        operator = -1
      end
      op_count = 0
    else
      op_count +=1
    end
    if starter
      starter = false
    else
      starter = true
    end

    #puts starter
    x, y = compute_next(x,y,starter,operator)
  end

  countstr = if count < 10
    "0#{count}"
  else
    count.to_s
  end

  num_array[x][y] = countstr
end



sum = 0
top_diagonal_start = [0,0]
bottom_diagonal_sum = [0, NUM]


#top
(0...NUM).to_a.each do |n|
  sum += num_array[n][n].to_i
  sum += num_array[(NUM-1) - n][n].to_i
end

p (sum - 1)



