# TODO: Split these up by teams
puts "Creating Default Lineups..."
puts "Creating Yankees Default Lineup..."
yankees = Team.find_by(name: "Yankees")

ellsbury = Player.find_by(last_name: "Ellsbury")
gardner = Player.find_by(last_name: "Gardner")
rodriguez = Player.find_by(last_name: "Rodriguez")
teixera = Player.find_by(last_name: "Teixeira")
mccann = Player.find_by(last_name: "McCann")
beltran = Player.find_by(last_name: "Beltran")
headley = Player.find_by(last_name: "Headley")
gregorius = Player.find_by(last_name: "Gregorius")
drew = Player.find_by(last_name: "Drew")

catcher = Position.find_by(scorebook_id: "2")
first_base = Position.find_by(scorebook_id: "3")
second_base = Position.find_by(scorebook_id: "4")
third_base = Position.find_by(scorebook_id: "5")
shortstop = Position.find_by(scorebook_id: "6")
left_field = Position.find_by(scorebook_id: "7")
center_field = Position.find_by(scorebook_id: "8")
right_field = Position.find_by(scorebook_id: "9")
designated_hitter = Position.find_by(scorebook_id: "DH")

DefaultLineupSlot.create!(
  team: yankees,
  player: ellsbury,
  position: center_field,
  slot: 1
)

DefaultLineupSlot.create!(
  team: yankees,
  player: gardner,
  position: left_field,
  slot: 2
)

DefaultLineupSlot.create!(
  team: yankees,
  player: rodriguez,
  position: designated_hitter,
  slot: 3
)

DefaultLineupSlot.create!(
  team: yankees,
  player: teixera,
  position: first_base,
  slot: 4
)

DefaultLineupSlot.create!(
  team: yankees,
  player: mccann,
  position: catcher,
  slot: 5
)

DefaultLineupSlot.create!(
  team: yankees,
  player: beltran,
  position: right_field,
  slot: 6
)

DefaultLineupSlot.create!(
  team: yankees,
  player: headley,
  position: third_base,
  slot: 7
)

DefaultLineupSlot.create!(
  team: yankees,
  player: gregorius,
  position: shortstop,
  slot: 8
)

DefaultLineupSlot.create!(
  team: yankees,
  player: drew,
  position: second_base,
  slot: 9
)

puts "Creating Red Sox Default Lineup..."
red_sox = Team.find_by(name: "Red Sox")

betts = Player.find_by(last_name: "Betts")
pedroia = Player.find_by(last_name: "Pedroia")
bogaerts = Player.find_by(last_name: "Bogaerts")
ortiz = Player.find_by(last_name: "Ortiz")
ramirez = Player.find_by(last_name: "Ramirez")
shaw = Player.find_by(last_name: "Shaw")
sandoval = Player.find_by(last_name: "Sandoval")
swihart = Player.find_by(last_name: "Swihart")
castillo = Player.find_by(last_name: "Castillo")

DefaultLineupSlot.create!(
  team: red_sox,
  player: betts,
  position: center_field,
  slot: 1
)

DefaultLineupSlot.create!(
  team: red_sox,
  player: pedroia,
  position: second_base,
  slot: 2
)

DefaultLineupSlot.create!(
  team: red_sox,
  player: bogaerts,
  position: shortstop,
  slot: 3
)

DefaultLineupSlot.create!(
  team: red_sox,
  player: ortiz,
  position: designated_hitter,
  slot: 4
)

DefaultLineupSlot.create!(
  team: red_sox,
  player: ramirez,
  position: left_field,
  slot: 5
)

DefaultLineupSlot.create!(
  team: red_sox,
  player: shaw,
  position: first_base,
  slot: 6
)

DefaultLineupSlot.create!(
  team: red_sox,
  player: sandoval,
  position: third_base,
  slot: 7
)

DefaultLineupSlot.create!(
  team: red_sox,
  player: swihart,
  position: catcher,
  slot: 8
)

DefaultLineupSlot.create!(
  team: red_sox,
  player: castillo,
  position: right_field,
  slot: 9
)
