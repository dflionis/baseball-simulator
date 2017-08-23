puts "Assigning Blue Jays players to positions..."

lf = Position.find_by(abbreviation: "LF")
cf = Position.find_by(abbreviation: "CF")
rf = Position.find_by(abbreviation: "RF")
ss = Position.find_by(abbreviation: "SS")
first_base = Position.find_by(abbreviation: "1B")
second_base = Position.find_by(abbreviation: "2B")
third_base = Position.find_by(abbreviation: "3B")
c = Position.find_by(abbreviation: "C")

martin = Player.find_by(last_name: "Martin", first_name: "Russell")
pillar = Player.find_by(last_name: "Pillar", first_name: "Kevin")
bautista = Player.find_by(last_name: "Bautista", first_name: "Jose")
encarnacion = Player.find_by(last_name: "Encarnacion", first_name: "Edwin")
goins = Player.find_by(last_name: "Goins", first_name: "Ryan")
donaldson = Player.find_by(last_name: "Donaldson", first_name: "Josh")
smoak = Player.find_by(last_name: "Smoak", first_name: "Justin")
revere = Player.find_by(last_name: "Revere", first_name: "Ben")
tulowitzki = Player.find_by(last_name: "Tulowitzki", first_name: "Troy")

PlayerPosition.create!(
  player: martin,
  position: c,
  fielding_rating: "1",
  frequency: 1
)

PlayerPosition.create!(
  player: martin,
  position: second_base,
  fielding_rating: "4",
  frequency: 2
)

PlayerPosition.create!(
  player: pillar ,
  position: cf,
  fielding_rating: "1",
  frequency: 1
)

PlayerPosition.create!(
  player: pillar ,
  position: lf,
  fielding_rating: "1",
  frequency: 2
)

PlayerPosition.create!(
  player: pillar ,
  position: rf,
  fielding_rating: "2",
  frequency: 3
)

PlayerPosition.create!(
  player: bautista ,
  position: rf,
  fielding_rating: "3",
  frequency: 1
)

PlayerPosition.create!(
  player: encarnacion ,
  position: first_base,
  fielding_rating: "3",
  frequency: 1
)

PlayerPosition.create!(
  player: goins ,
  position: second_base,
  fielding_rating: "1",
  frequency: 1
)

PlayerPosition.create!(
  player: goins ,
  position: ss,
  fielding_rating: "2",
  frequency: 2
)

PlayerPosition.create!(
  player: goins ,
  position: lf,
  fielding_rating: "4",
  frequency: 3
)

PlayerPosition.create!(
  player: goins ,
  position: rf,
  fielding_rating: "4",
  frequency: 4
)

PlayerPosition.create!(
  player: donaldson ,
  position: third_base,
  fielding_rating: "2",
  frequency: 1
)

PlayerPosition.create!(
  player: donaldson ,
  position: first_base,
  fielding_rating: "2",
  frequency: 1
)

PlayerPosition.create!(
  player: revere ,
  position: lf,
  fielding_rating: "2",
  frequency: 1
)

PlayerPosition.create!(
  player: revere ,
  position: cf,
  fielding_rating: "2",
  frequency: 2
)

PlayerPosition.create!(
  player: tulowitzki ,
  position: ss,
  fielding_rating: "2",
  frequency: 1
)

PlayerPosition.create!(
  player: smoak ,
  position: first_base,
  fielding_rating: "2",
  frequency: 1
)
