FactoryGirl.define do
  factory :game_lineup_slot do
    association :game
    association :player
    association :position
    association :team
    slot 1
  end
end
