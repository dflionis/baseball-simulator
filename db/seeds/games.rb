puts "Creating Games..."
away_team = Team.find_by(name: "Yankees")
home_team = Team.find_by(name: "Red Sox")

Game.create!(
  away_team: away_team,
  home_team: home_team,
  start_time: Time.now,
  status: :scheduled
)
