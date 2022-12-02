data = File.read("input.txt")

games_array = data.split("\n")

p games_array[0]

# OPPONENT HAND
# A = ROCK (1 point)
# B = PAPER (2 points)
# C = SCISSORS (3 points)

# MY HAND
# X = ROCK (1 point)
# Y = PAPER (2 points)
# Z = SCISSORS (3 points)

# GAME POINTS
# LOSS = 0
# DRAW = 3
# WIN = 6

game_outcomes = [
  ["A","X",1,3],
  ["A","Y",2,6],
  ["A","Z",3,0],
  ["B","X",1,0],
  ["B","Y",2,3],
  ["B","Z",3,6],
  ["C","X",1,6],
  ["C","Y",2,0],
  ["C","Z",3,3],
]

my_score = 0

# CHALLENGE 1

games_array.each do |game|
  outcome = game_outcomes.find { |outcome| game[0] == outcome[0] && game[2] == outcome[1] }
  my_score += (outcome[2] + outcome[3])
end

p my_score


# CHALLENGE 2

# X means loss, 0 points
# Y means draw, 3 points
# Z means win, 6 points

my_score_two = 0

games_array.each do |game|
  opponent_hand = game[0]
  strategy = game[2]

  if opponent_hand == "A" && strategy == "X"
    # strategy is loss (0 points), hand is scissors (3 points)
    my_score_two += 3
  elsif opponent_hand == "A" && strategy == "Y"
    # strategy is draw (3 points), hand is rock (1 point)
    my_score_two += 4
  elsif opponent_hand == "A" && strategy == "Z"
    # strategy is win (6 points), hand is paper (2 points)
    my_score_two += 8
  elsif opponent_hand == "B" && strategy == "X"
    # strategy is loss (0 points), hand is rock (1 point)
    my_score_two += 1
  elsif opponent_hand == "B" && strategy == "Y"
    # strategy is draw (3 points), hand is paper (2 points)
    my_score_two += 5
  elsif opponent_hand == "B" && strategy == "Z"
    # strategy is win (6 points), hand is scissors (3 points)
    my_score_two += 9
  elsif opponent_hand == "C" && strategy == "X"
    # strategy is loss (0 points), hand is paper (2 points)
    my_score_two += 2
  elsif opponent_hand == "C" && strategy == "Y"
    # strategy is draw (3 points), hand is scissors (3 points)
    my_score_two += 6
  elsif opponent_hand == "C" && strategy == "Z"
    # strategy is win (6 points), hand is rock (1 point)
    my_score_two += 7
  end
end

p my_score_two
