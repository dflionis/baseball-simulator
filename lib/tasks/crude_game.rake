namespace :crude_game do
  desc "First attempt at a full game to flush out necessary classes, etc"
  task :sox_vs_yanks => :environment do
    game = create_new_exhibition_game

    game.play!
  end

  def create_new_exhibition_game
    high_id = 99999
    Game.destroy(high_id) if Game.where(id: high_id).count > 0
    game = Game.create!(
      id: high_id,
      away_team: Team.find_by(name: "Yankees"),
      home_team: Team.find_by(name: "Red Sox")
    )
  end
end
