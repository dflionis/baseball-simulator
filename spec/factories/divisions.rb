FactoryGirl.define do
  factory :al_east, class: Division do
    region "East"
    association :league, factory: :american_league
  end
end
