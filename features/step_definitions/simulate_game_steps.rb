require "rake"

Given(/Rake Tasks are available/) do
  Rake::Task.clear
  BaseballSimulator::Application.load_tasks
  Rake::Task["db:environment:set"].invoke("RAILS_ENV=test")
end

Given(/the Yankees and Red Sox rosters are loaded/) do
  Rake::Task["db:reset"].reenable
  Rake::Task["db:reset"].invoke
end

When(/I simulate a game between the Yankees and Red Sox/) do
  @game = Game.create!(
    away_team: Team.find_by(name: "Yankees"),
    home_team: Team.find_by(name: "Red Sox")
  )

  @game.play!
end

Then(/the game should play itself until completion/) do
  expect(@game.status).to eq("final")
  expect(@game.away_score).not_to eq(@game.home_score)
  expect(@game.innings.count).to be >= 17
end
