#By starting at the top of the triangle below and moving to adjacent numbers on the row below, the maximum total from top to bottom is 23.
#
#3
#7 4
#2 4 6
#8 5 9 3
#
#That is, 3 + 7 + 4 + 9 = 23.
#
#Find the maximum total from top to bottom of the triangle below:
#
#75
#95 64
#17 47 82
#18 35 87 10
#20 04 82 47 65
#19 01 23 75 03 34
#88 02 77 73 07 63 67
#99 65 04 28 06 16 70 92
#41 41 26 56 83 40 80 70 33
#41 48 72 33 47 32 37 16 94 29
#53 71 44 65 25 43 91 52 97 51 14
#70 11 33 28 77 73 17 78 39 68 17 57
#91 71 52 38 17 14 91 43 58 50 27 29 48
#63 66 04 68 89 53 67 30 73 16 69 87 40 31
#04 62 98 27 23 09 70 98 73 93 38 53 60 04 23
#
#NOTE: As there are only 16384 routes, it is possible to solve this problem by trying every route.
class String
  def split_to_i
    self.split(' ').map(&:to_i)
  end
end

num = "75
95 64
17 47 82
18 35 87 10
20 04 82 47 65
19 01 23 75 03 34
88 02 77 73 07 63 67
99 65 04 28 06 16 70 92
41 41 26 56 83 40 80 70 33
41 48 72 33 47 32 37 16 94 29
53 71 44 65 25 43 91 52 97 51 14
70 11 33 28 77 73 17 78 39 68 17 57
91 71 52 38 17 14 91 43 58 50 27 29 48
63 66 04 68 89 53 67 30 73 16 69 87 40 31
04 62 98 27 23 09 70 98 73 93 38 53 60 04 23"

rows = num.split("\n").map(&:split_to_i)

(0..(rows.index(rows.last) - 1)).to_a.reverse.each do |y|
  puts y
  (0..(rows[y].length-1)).each do |x|
    t_n = rows[y][x]
    rows[y][x] = [(t_n + rows[y+1][x]), (t_n + rows[y+1][x+1])].max
  end
end

puts rows.first.first




#rows = num.split("\n").map(&:split_to_i)
#row_n = 0
#sum = rows[row_n][0]
#track = 0
#rows.each do |row|
#  row_n = rows.index(row)
#  if row != rows[0]
#    a = if row_n == rows.length - 1
#      0
#    else
#      1
#    end
#    puts rows[row_n+a][track+1]
#    optimal_values = {
#      "#{track}_#{track}"=> (row[track]||0) + (rows[row_n+a][track]||0),
#      "#{track}_#{track+1}"=> (row[track]||0) + (rows[row_n+a][track+1]||0),
#      "#{track+1}_#{track}"=> (row[track+1]||0) + (rows[row_n+a][track+1]||0),
#      "#{track+1}_#{track+1}"=> (row[track+1]||0) + (rows[row_n+a][(track+1)+1]||0)
#    }
#    puts optimal_values.inspect
#    optimal_max = optimal_values.values.max
#    track = optimal_values.map{|k,v| k if v == optimal_max}.uniq.compact.first.split('_').first.to_i
#    #max_val = near_val.max
#    sum+= row[track]
#  end
#end
#
#p sum



