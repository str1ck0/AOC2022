# PART ONE
# Every item type is identified by a single lowercase
# or uppercase letter (that is, a and A refer to different types of items).

# A given rucksack always has the same number of items in each of its
# two compartments, so the first half of the characters represent
# items in the first compartment, while the second half of the characters
# represent items in the second compartment.

# To help prioritize item rearrangement, every item type can be converted to a priority:
  # - Lowercase item types a through z have priorities 1 through 26.
  # - Uppercase item types A through Z have priorities 27 through 52.

# Find the item type that appears in both compartments of each rucksack.
# What is the sum of the priorities of those item types?

# TO DO
# For each rucksack (each line of input):
  # Split the line in half - each compartment
  # Find the item that appears in both compartments
  # Find that item's corresponding priority
  # Sum all of those priorities

data = File.read("input.txt")

rucksacks_array = data.split("\n")

lower_alf = ('a'..'z').to_a
lower_num = (1..26).to_a
upper_alf = ('A'..'Z').to_a
upper_num = (27..52).to_a

priolower = Hash[lower_alf.zip lower_num]
prioupper = Hash[upper_alf.zip upper_num]

priorities_hash = priolower.merge(prioupper)

total = 0

rucksacks_array.each do |rucksack|
  comp1, comp2 = rucksack.chars.each_slice(rucksack.length / 2).map(&:join)
  # p "--------comp1----------"
  # p comp1
  # p "----------comp2----------"
  # p comp2
  # p "---------common char----------"
  common = (comp1.chars & comp2.chars).join
  # p common
  total += priorities_hash.fetch(common)
end

p total

# PART TWO

# TO DO
# Split the input into groups of 3 lines each
# Find the character that appears in each of the 3 lines for each group
# Find the priority number for this item
# Sum the priority numbers

data2 = File.read("input.txt")

elves_array = data.split

groups_array = elves_array.each_slice(3).to_a

badge_total = 0

groups_array.each do |group|
  elf1 = group[0]
  elf2 = group[1]
  elf3 = group[2]
  badge = (elf1.chars & elf2.chars & elf3.chars).join
  badge_total += priorities_hash.fetch(badge)
end

p badge_total
