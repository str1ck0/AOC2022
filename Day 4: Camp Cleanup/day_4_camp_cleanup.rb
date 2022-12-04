elf_pairs = File.read("input.txt")

splitted = elf_pairs.split("\n")

tally = 0

splitted.each do |pair|
  split_pair = pair.split(",")
  elf1 = split_pair[0].split("-")
  elf2 = split_pair[1].split("-")
  # p elf1
  # p elf2
  elf1_int = elf1.map(&:to_i)
  elf2_int = elf2.map(&:to_i)
  elf1_range = (elf1_int[0]..elf1_int[-1])
  elf2_range = (elf2_int[0]..elf2_int[-1])
  # p elf1_range
  # p elf2_range
  # if elf1_range.cover?(elf2_range) or elf2_range.cover?(elf1_range)
  #   tally += 1
  # end

  def ranges_overlap?(range_a, range_b)
    range_b.begin <= range_a.end && range_a.begin <= range_b.end
  end

  if ranges_overlap?(elf1_range, elf2_range)
    tally += 1
  end
end

p tally
