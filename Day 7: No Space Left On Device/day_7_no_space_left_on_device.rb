# Find all of the directories with a total size of at most 100000.
# What is the sum of the total sizes of those directories?

def create_structure
  # Create empty array to hold instructions
  instructions = []
  # Add each line of the input to the instructions array
  File.readlines("input.txt").each do |line|
    instructions << line.chomp
  end

  # Create empty hierarchy array
  hierarchy = []
  # Create a new hash called filesystem with the default value being an empty hash
  filesystem = Hash.new({})
  # Assign filesystem hash to variable current_dir
  current_dir = filesystem

  # iterate over each input in the instructions array
  instructions.each do |input|
    # Case to look at: the input's first value
    case input[0]
    # When input is a command ($)
    when "$"
      # If command is cd (change directory)
      if input[2] == "c"
        # If cd ends in '.' (move out one level)
        if input[-1] == "."
          # Current directory becomes last element of hierarchy array
          current_dir = hierarchy.pop
        else
          # Cd to specific directory - Push current directory into hierarchy array
          hierarchy << current_dir
          # Current directory becomes specific directory
          current_dir = current_dir[input[5..]]
        end
      end
    when "d"
      unless current_dir[input[4..]]
        current_dir[input[4..]] = {}
      end
    when /[0-9]/
      data = input.split
      filesize = data.first
      filename = data.last
      current_dir[filename] = filesize.to_i
    end
  end

  # PART ONE
  below_100000 = []
  total_used = calculate_dir_size(filesystem[:/], below_100000, 0)
  puts "PART ONE: Dirs under 100_000 sum is #{below_100000.reduce(:+)}"
  # p below_100000

  # PART TWO
  equal_or_more_than = []
  total_used = calculate_dir_size(filesystem[:/], equal_or_more_than, 0)
  current_free = 70_000_000 - total_used
  needed_space = 30_000_000 - current_free
  puts "PART TWO: Total used space is #{total_used}. Total filesystem space is 70_000_000. We need 30_000_000. Current free space is #{current_free}."
  puts "So we look for #{needed_space}."
  p equal_or_more_than.min
end

def calculate_dir_size(hash, array, indent)
  this_level_total = 0
  folders_below = 0
  hash.each do |k, v|
    if v.is_a? Integer
      this_level_total += v
    elsif v.is_a? Hash
      folders_below = calculate_dir_size(v, array, indent + 2)
      this_level_total += folders_below
    end
  end

  # array << this_level_total if this_level_total < 100_000
  array << this_level_total if this_level_total >= 2677139
  this_level_total
end

create_structure
