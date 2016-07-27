FactoryGirl.define do
  factory :al_east, class: Division do
    region "East"
    association :league, factory: :american_league
  end

  factory :nl_east, class: Division do
    region "East"
    association :league, factory: :national_league
  end

  factory :al_west, class: Division do
    region "West"
    association :league, factory: :fake_league
  end

  factory :nl_west, class: Division do
    region "West"
    association :league, factory: :another_fake_league
  end
end
