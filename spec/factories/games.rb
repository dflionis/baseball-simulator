FactoryGirl.define do
  factory :scheduled_game, class: Game do
    association :away_team, factory: :mets
    association :home_team, factory: :red_sox
    game_status :scheduled
    start_time Time.now
  end
end
