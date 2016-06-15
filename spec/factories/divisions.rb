FactoryGirl.define do
  factory :al_east, class: Division do
    region "East"
    association :league, factory: :american_league
  end

  factory :nl_east, class: Division do
    region "East"
    association :league, factory: :national_league
  end
end
