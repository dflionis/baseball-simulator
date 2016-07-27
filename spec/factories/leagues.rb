FactoryGirl.define do
  factory :american_league, class: League do
    name "American League"
    dh true
  end

  factory :national_league, class: League do
    name "National League"
    dh false
  end

  factory :fake_league, class: League do
    name "Fake League"
    dh true
  end

  factory :another_fake_league, class: League do
    name "Another Fake League"
    dh false
  end
end
