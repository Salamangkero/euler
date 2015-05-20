

#number spiral

require 'pry'
NUM = 8


# create multi array

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

num_array.each do |ary|
  p ary.join(" ")
end

