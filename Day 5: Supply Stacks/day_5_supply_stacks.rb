STACKS = {}
STACKS[1] = %w(S C V N)
STACKS[2] = %w(Z M J H N S)
STACKS[3] = %w(M C T G J N D)
STACKS[4] = %w(T D F J W R M)
STACKS[5] = %w(P F H)
STACKS[6] = %w(C T Z H J)
STACKS[7] = %w(D P R Q F S L Z)
STACKS[8] = %w(C S L H D F P W)
STACKS[9] = %w(D S M P F N G Z)

data = File.read("procedure.txt")

# move (how many) from (start stack) to (end stack)

instructions = data.split("\n")

clean_instructions = instructions.map do |instruction|
  split_instruction = instruction.split(" ")
  split_instruction.delete_at(0)
  split_instruction.delete_at(1)
  split_instruction.delete_at(2)
  only_number = split_instruction.map(&:to_i)
end

# how many = instruct[0]
# start stack =  instruct[1]
# end stack = instruct[2]

clean_instructions.each do |instruct|
  instruct[0].times do
    move = STACKS[instruct[1]].pop
    STACKS[instruct[2]].push(move)
  end
end

clean_instructions.each do |instruct|
  move = STACKS[instruct[1]].pop(instruct[0])
  STACKS[instruct[2]].push(move).flatten!
end

# p STACKS

result = ""

STACKS.each do |stack|
  last = stack[1].last
  result += last
end

p result
