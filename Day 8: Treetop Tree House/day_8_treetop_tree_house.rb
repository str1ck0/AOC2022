# All trees on the outside are visible, therefore the first
# and last lines (top and bottom), as well as the first and
# last element in each line (left and right).

# A tree is visible if there are no taller trees either above,
# below, left or right of it.

# above: element in any previous line at the same index
# below: element in any subsequent line at the same index
# left: any previous element in the line
# right: any subsequent element in the line

# Visible trees is an empty array
# If a tree is visible, add it to the array, or +1 to a count

# Create an array of line arrays
# lines = []
# File.readlines("input.txt").each do |line|
#   lines << line.chomp.split
# end

# tree_lines = []
# lines.each do |line|
#   tree_lines << line[0].split("")
# end

# visible = []
# # Leftmost and rightmost trees are visible, add to array
# tree_lines.each do |tree_line|
#   visible << tree_line[0]
#   visible << tree_line[-1]
# end
# # Top row is visible, add to array (skip first and last)
# visible << tree_lines[0][1..-2]
# # Bottom row is visible, add to array (skip first and last)
# visible << tree_lines[-1][1..-2]

# # Iterate over each tree in a tree_line
# # If tree is greater than any tree to left or right, add to array

# # start at the 2nd index position (first row already added)
# position = 1

# tree_lines.each do |line|
#   tree_integers = line.map(&:to_i)
#   tallest = tree_integers.max
#   tree_integers.each do |tree|
#     if tree_integers[1] == tallest || tree_integers[-2] == tallest
#       tree_integers
# end

# p visible.flatten.count



# if line[position].to_i > line[position + 1].to_i
#   visible << tree_line[tree_position]
# end
# position += 1


# xgrid = []
# ygrid = []

# File.readlines("input.txt").each do |line|
#   xs = line.chars.map(&:to_i)
#   xgrid << xs
#   xs.each_with_index do |x, idx|
#     if ygrid[idx].nil?
#       ygrid[idx] = [x]
#     else
#       ygrid[idx] << x
#     end
#   end
# end

# width = xgrid[0].size
# height = xgrid.size
# count = 0
# (1..width - 2).each do |x|
#   (1..height -2).each do |y|
#     left = xgrid[x][0, y].max
#     right = xgrid[x][y + 1, width].max
#     up = ygrid[y][0, x].max
#     down = ygrid[y][x + 1, height].max
#     next unless xgrid[x][y] > left ||
#                 xgrid[x][y] > right ||
#                 xgrid[x][y] > up ||
#                 xgrid[x][y] > down

#     count += 1
#   end
# end
# puts count + (2 * width) + (2 * (height - 2))

arr = []

File.readlines('input.txt').each do |line|
  arr << line.chomp.chars
end

def check_left?(line, tree, idx)
  line[0..idx].all? { |x| x < tree }
end

def check_right?(line, tree, idx)
  line[idx..].all? { |x| x < tree }
end

def check_up?(arr, idx, tree, lidx)
  0.upto(idx - 1) do |x|
    if arr[x][lidx] >= tree
      return false
    end
  end
  true
end

def check_down?(arr, idx, tree, lidx)
  (idx + 1).upto(arr.length - 1) do |x|
    if arr[x][lidx] >= tree
      return false
    end
  end
  true
end

edges = arr[0].length * 2 + arr.length * 2 - 4
visible = edges

# iterate through each line of trees in the array
arr.each_with_index do |line, idx|
  # next line if index is 0 or -1, as these are top and bottom edges
  next if idx == 0
  next if idx == arr.length - 1

  # iterate through each tree in a line of trees
  line.each_with_index do |tree, lidx|
    # next iteration if line index is 0 or -1, as these are left and right edges
    next if lidx == 0
    next if lidx == line.length - 1

    # If check_left? is true, add 1 to visible and next iteration
    if check_left?(line, tree, lidx - 1)
      visible += 1
      next
    elsif check_right?(line, tree, lidx + 1)
      visible += 1
      next
    elsif check_up?(arr, idx, tree, lidx)
      visible += 1
      next
    elsif check_down?(arr, idx, tree, lidx)
      visible += 1
    end
  end
end
