FactoryGirl.define do
  factory :scheduled_game, class: Game do
    association :away_team, factory: :angels
    association :home_team, factory: :dodgers
    status :scheduled
    start_time Time.now
  end
end
