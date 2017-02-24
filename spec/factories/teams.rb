FactoryGirl.define do
  factory :red_sox, class: Team do
    city "Boston"
    name "Red Sox"
    abbreviation "BOS"
    association :division, factory: :al_east
  end

  factory :mets, class: Team do
    city "New York"
    name "Mets"
    abbreviation "NYM"
    association :division, factory: :nl_east
  end

  factory :yankees, class: Team do
    city "New York"
    name "Yankees"
    abbreviation "NYY"
    association :division, factory: :al_east
  end

  factory :angels, class: Team do
    city "Anaheim"
    name "Angels"
    abbreviation "LAA"
    association :division, factory: :al_west
  end

  factory :dodgers, class: Team do
    city "Los Angeles"
    name "Dodgers"
    abbreviation "LAD"
    association :division, factory: :nl_west
  end
end
