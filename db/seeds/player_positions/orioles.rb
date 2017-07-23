puts "Assigning Orioles players to positions..."

lf = Position.find_by(abbreviation: "LF")
cf = Position.find_by(abbreviation: "CF")
rf = Position.find_by(abbreviation: "RF")
ss = Position.find_by(abbreviation: "SS")
first_base = Position.find_by(abbreviation: "1B")
second_base = Position.find_by(abbreviation: "2B")
third_base = Position.find_by(abbreviation: "3B")
c = Position.find_by(abbreviation: "C")

=begin
3B Manny Machado
RF Gerardo Parra
CF Adam Jones
1B Chris Davis
LF Steve Pearce
2B Jonathan Schoop
DH Jimmy Paredes
SS J.J. Hardy
C Caleb Joseph

SP Wei-Yin Chen
=end

machado = Player.find_by(last_name: "Machado", first_name: "Manny")
parra = Player.find_by(last_name: "Parra", first_name: "Gerardo")
jones = Player.find_by(last_name: "Jones", first_name: "Adam")
davis = Player.find_by(last_name: "Davis", first_name: "Chris")
pearce = Player.find_by(last_name: "Pearce", first_name: "Steve")
schoop = Player.find_by(last_name: "Schoop", first_name: "Jonathan")
paredes = Player.find_by(last_name: "Paredes", first_name: "Jimmy")
hardy = Player.find_by(last_name: "Hardy", first_name: "J.J.")
joseph = Player.find_by(last_name: "Joseph", first_name: "Caleb")

PlayerPosition.create!(
  player: machado,
  position: third_base,
  fielding_rating: "2",
  frequency: 1
)

PlayerPosition.create!(
  player: machado,
  position: ss,
  fielding_rating: "3",
  frequency: 2
)

PlayerPosition.create!(
  player: parra,
  position: rf,
  fielding_rating: "2",
  frequency: 1
)

PlayerPosition.create!(
  player: parra,
  position: lf,
  fielding_rating: "2",
  frequency: 2
)

PlayerPosition.create!(
  player: parra,
  position: cf,
  fielding_rating: "2",
  frequency: 3
)

PlayerPosition.create!(
  player: jones,
  position: cf,
  fielding_rating: "1",
  frequency: 1
)

PlayerPosition.create!(
  player: davis,
  position: first_base,
  fielding_rating: "2",
  frequency: 1
)

PlayerPosition.create!(
  player: davis,
  position: rf,
  fielding_rating: "4",
  frequency: 2
)

PlayerPosition.create!(
  player: pearce,
  position: lf,
  fielding_rating: "4",
  frequency: 1
)

PlayerPosition.create!(
  player: pearce,
  position: first_base,
  fielding_rating: "3",
  frequency: 2
)

PlayerPosition.create!(
  player: pearce,
  position: second_base,
  fielding_rating: "4",
  frequency: 3
)

PlayerPosition.create!(
  player: pearce,
  position: rf,
  fielding_rating: "4",
  frequency: 4
)

PlayerPosition.create!(
  player: schoop,
  position: second_base,
  fielding_rating: "2",
  frequency: 1
)

PlayerPosition.create!(
  player: paredes,
  position: second_base,
  fielding_rating: "5",
  frequency: 1
)

PlayerPosition.create!(
  player: paredes,
  position: third_base,
  fielding_rating: "5",
  frequency: 2
)

PlayerPosition.create!(
  player: paredes,
  position: rf,
  fielding_rating: "4",
  frequency: 3
)

PlayerPosition.create!(
  player: hardy,
  position: ss,
  fielding_rating: "2",
  frequency: 1
)

PlayerPosition.create!(
  player: joseph,
  position: c,
  fielding_rating: "2",
  frequency: 1
)

PlayerPosition.create!(
  player: joseph,
  position: first_base,
  fielding_rating: "4",
  frequency: 2
)
