data = File.read("input.txt")

characters = data.split("")

array = []

# PART 1

characters.each_with_index do |char, index|
  # if there are 4 chars in array, remove the first char
  array.shift if array.size == 4
  # add char to array
  array << char
  # if array has 4 chars and is unique, p last char's index + 1
  if array.size == 4 && array.uniq == array
    p index + 1
  end
end

# PART 2

characters.each_with_index do |char, index|
  # if there are 14 chars in array, remove the first char
  array.shift if array.size == 14
  # add char to array
  array << char
  # if array has 14 chars and is unique, p last char's index + 1
  if array.size == 14 && array.uniq == array
    p index + 1
  end
end
