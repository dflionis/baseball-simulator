namespace :crude_game do
  desc "Red Sox vs Yankees simulation"
  task :sox_vs_yanks => :environment do
    game = create_new_exhibition_game("Yankees", "Red Sox")

    game.play!
  end

  desc "Blue Jays vs Orioles simulation"
  task :jays_vs_orioles => :environment do
    game = create_new_exhibition_game("Orioles", "Blue Jays")

    game.play!
  end

  def create_new_exhibition_game(away_team_name, home_team_name)
    high_id = 99999
    Game.destroy(high_id) if Game.where(id: high_id).count > 0
    game = Game.create!(
      id: high_id,
      away_team: Team.find_by(name: away_team_name),
      home_team: Team.find_by(name: home_team_name)
    )
  end
end
