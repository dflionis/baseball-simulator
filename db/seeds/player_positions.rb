puts "Assigning Players to Positions..."
betts = Player.find_by(last_name: "Betts", first_name: "Mookie")
cf = Position.find_by(abbreviation: "CF")
rf = Position.find_by(abbreviation: "RF")

PlayerPosition.create(
  player: betts,
  position: cf,
  fielding_rating: "2",
  frequency: 1
)

PlayerPosition.create(
  player: betts,
  position: rf,
  fielding_rating: "3",
  frequency: 2
)
