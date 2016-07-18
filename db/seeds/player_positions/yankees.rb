puts "Assigning Yankee players to positions..."

lf = Position.find_by(abbreviation: "LF")
cf = Position.find_by(abbreviation: "CF")
rf = Position.find_by(abbreviation: "RF")
ss = Position.find_by(abbreviation: "SS")
first_base = Position.find_by(abbreviation: "1B")
second_base = Position.find_by(abbreviation: "2B")
third_base = Position.find_by(abbreviation: "3B")
c = Position.find_by(abbreviation: "C")

# CF Ellsbury
# LF Gardner
# DH Rodriguez
# 1B Teixeira
# C McCann
# RF Beltran
# 3B Headley
# SS Gregorius
# 2B Drew

gregorius = Player.find_by(last_name: "Gregorius", first_name: "Didi")
headley = Player.find_by(last_name: "Headley", first_name: "Chase")
beltran = Player.find_by(last_name: "Beltran", first_name: "Carlos")
mccann = Player.find_by(last_name: "McCann", first_name: "Brian")
gardner = Player.find_by(last_name: "Gardner", first_name: "Brett")
drew = Player.find_by(last_name: "Drew", first_name: "Stephen")
teixeira = Player.find_by(last_name: "Teixeira", first_name: "Mark")
rodriguez = Player.find_by(last_name: "Rodriguez", first_name: "Alex")
ellsbury = Player.find_by(last_name: "Ellsbury", first_name: "Jacoby")

PlayerPosition.create!(
  player: gregorius,
  position: ss,
  fielding_rating: "1",
  frequency: 1
)

PlayerPosition.create!(
  player: headley,
  position: third_base,
  fielding_rating: "3",
  frequency: 1
)

PlayerPosition.create!(
  player: headley,
  position: first_base,
  fielding_rating: "4",
  frequency: 2
)

PlayerPosition.create!(
  player: beltran,
  position: rf,
  fielding_rating: "4",
  frequency: 1
)

PlayerPosition.create!(
  player: mccann,
  position: c,
  fielding_rating: "2",
  frequency: 1
)

PlayerPosition.create!(
  player: mccann,
  position: first_base,
  fielding_rating: "4",
  frequency: 2
)

PlayerPosition.create!(
  player: gardner,
  position: lf,
  fielding_rating: "1",
  frequency: 1
)

PlayerPosition.create!(
  player: gardner,
  position: cf,
  fielding_rating: "2",
  frequency: 2
)

PlayerPosition.create!(
  player: drew,
  position: second_base,
  fielding_rating: "2",
  frequency: 1
)

PlayerPosition.create!(
  player: drew,
  position: ss,
  fielding_rating: "4",
  frequency: 2
)

PlayerPosition.create!(
  player: drew,
  position: third_base,
  fielding_rating: "4",
  frequency: 3
)

PlayerPosition.create!(
  player: teixeira,
  position: first_base,
  fielding_rating: "2",
  frequency: 1
)

PlayerPosition.create!(
  player: rodriguez,
  position: first_base,
  fielding_rating: "5",
  frequency: 1
)

PlayerPosition.create!(
  player: rodriguez,
  position: third_base,
  fielding_rating: "5",
  frequency: 2
)

PlayerPosition.create!(
  player: ellsbury,
  position: cf,
  fielding_rating: "1",
  frequency: 1
)
