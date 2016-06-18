FactoryGirl.define do
  factory :top_of_the_first, class: Inning do
    association :game, factory: :scheduled_game
    half :top
    status :completed
    number 1
    runs 0
  end
end
