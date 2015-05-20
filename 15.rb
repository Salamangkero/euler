#Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.
#
#
#How many such routes are there through a 20×20 grid?


max = 20

grid = []
max.times do |y|
  grid[y] ||= []
  max.times do |x|
    grid[y][x] = if x == 0 or y == 0
      1
    else
      grid[y-1][x] + grid[y][x-1]
    end
    x+=1
  end
  y+=1
end
p  grid.flatten.inject(1,:+)