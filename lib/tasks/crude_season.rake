namespace :crude_season do
  HIGH_ID = 99999
  GAMES_IN_SEASON = 162

  desc "AL East (minus Tampa) simulation"
  task :play => :environment do
    season = create_new_season

    season.play!
    season.report!
  end

  def create_new_season
    puts "clearing out old season data..."
    Season.destroy(HIGH_ID) if Season.where(id: HIGH_ID).count > 0
    puts "making new season..."
    season = Season.create!(
      id: HIGH_ID,
      name: "Crude AL East Season"
    )

    league = {
      "team1" => Team.find_by(name: "Yankees"),
      "team2" => Team.find_by(name: "Red Sox"),
      "team3" => Team.find_by(name: "Blue Jays"),
      "team4" => Team.find_by(name: "Orioles")
    }

    puts "Creating Schedule..."
    (GAMES_IN_SEASON / ((league.size - 1) * 2)).times do |n|
      puts "Creating schedule iteration #{n}"
      Game.create!(season: season, away_team: league["team1"], home_team: league["team2"])
      Game.create!(season: season, away_team: league["team1"], home_team: league["team3"])
      Game.create!(season: season, away_team: league["team1"], home_team: league["team4"])

      Game.create!(season: season, away_team: league["team2"], home_team: league["team1"])
      Game.create!(season: season, away_team: league["team2"], home_team: league["team3"])
      Game.create!(season: season, away_team: league["team2"], home_team: league["team4"])

      Game.create!(season: season, away_team: league["team3"], home_team: league["team1"])
      Game.create!(season: season, away_team: league["team3"], home_team: league["team2"])
      Game.create!(season: season, away_team: league["team3"], home_team: league["team4"])

      Game.create!(season: season, away_team: league["team4"], home_team: league["team1"])
      Game.create!(season: season, away_team: league["team4"], home_team: league["team2"])
      Game.create!(season: season, away_team: league["team4"], home_team: league["team3"])
    end

    season
  end
end
