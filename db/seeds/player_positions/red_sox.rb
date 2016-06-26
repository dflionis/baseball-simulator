puts "Assigning Red Sox players to positions..."

lf = Position.find_by(abbreviation: "LF")
cf = Position.find_by(abbreviation: "CF")
rf = Position.find_by(abbreviation: "RF")
ss = Position.find_by(abbreviation: "SS")
first_base = Position.find_by(abbreviation: "1B")
second_base = Position.find_by(abbreviation: "2B")
third_base = Position.find_by(abbreviation: "3B")
c = Position.find_by(abbreviation: "C")

# http://www.baseball-reference.com/teams/BOS/2015-batting-orders.shtml
# CF betts
# 2B pedroia
# SS bogaerts
# DH ortiz
# LF ramirez
# 1B shaw
# 3B sandoval
# c swihart
# RF castillo

betts = Player.find_by(last_name: "Betts", first_name: "Mookie")
bogaerts = Player.find_by(last_name: "Bogaerts", first_name: "Xander")
ortiz = Player.find_by(last_name: "Ortiz", first_name: "David")
pedroia = Player.find_by(last_name: "Pedroia", first_name: "Dustin")
ramirez = Player.find_by(last_name: "Ramirez", first_name: "Hanley")
castillo = Player.find_by(last_name: "Castillo", first_name: "Rusney")
swihart = Player.find_by(last_name: "Swihart", first_name: "Blake")
sandoval = Player.find_by(last_name: "Sandoval", first_name: "Pablo")
shaw = Player.find_by(last_name: "Shaw", first_name: "Travis")

PlayerPosition.create!(
  player: betts,
  position: cf,
  fielding_rating: "2",
  frequency: 1
)

PlayerPosition.create!(
  player: betts,
  position: rf,
  fielding_rating: "3",
  frequency: 2
)

PlayerPosition.create!(
  player: bogaerts,
  position: ss,
  fielding_rating: "2",
  frequency: 1
)

PlayerPosition.create!(
  player: ortiz,
  position: first_base,
  fielding_rating: "5",
  frequency: 1
)

PlayerPosition.create!(
  player: pedroia,
  position: second_base,
  fielding_rating: "2",
  frequency: 1
)

PlayerPosition.create!(
  player: ramirez,
  position: lf,
  fielding_rating: "5",
  frequency: 1
)

PlayerPosition.create!(
  player: ramirez,
  position: third_base,
  fielding_rating: "5",
  frequency: 2
)

PlayerPosition.create!(
  player: castillo,
  position: rf,
  fielding_rating: "3",
  frequency: 1
)

PlayerPosition.create!(
  player: castillo,
  position: cf,
  fielding_rating: "3",
  frequency: 2
)

PlayerPosition.create!(
  player: castillo,
  position: lf,
  fielding_rating: "3",
  frequency: 3
)

PlayerPosition.create!(
  player: swihart,
  position: c,
  fielding_rating: "4",
  frequency: 1
)

PlayerPosition.create!(
  player: sandoval,
  position: third_base,
  fielding_rating: "4",
  frequency: 1
)

PlayerPosition.create!(
  player: shaw,
  position: first_base,
  fielding_rating: "2",
  frequency: 1
)

PlayerPosition.create!(
  player: shaw,
  position: third_base,
  fielding_rating: "4",
  frequency: 2
)

PlayerPosition.create!(
  player: shaw,
  position: lf,
  fielding_rating: "5",
  frequency: 3
)
