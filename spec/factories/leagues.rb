FactoryGirl.define do
  factory :american_league, class: League do
    name "American League"
    dh true
  end

  factory :national_league, class: League do
    name "National League"
    dh false
  end
end
