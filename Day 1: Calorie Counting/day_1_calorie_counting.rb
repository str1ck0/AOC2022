input = File.read("input.txt")

puts input
puts "------------break------------"
p input.split("\n")
puts "------------break------------"
p input.split("\n\n")
puts "------------break------------"
p input.split("\n\n").map {_1.split("\n")}
puts "------------break------------"
p input.split("\n\n").map {_1.split("\n").map(&:to_i)}
puts "------------break------------"
puts input.split("\n\n").map {_1.split("\n").map(&:to_i).sum}.max
