FactoryGirl.define do
  factory :red_sox, class: Team do
    city "Boston"
    name "Red Sox"
    association :division, factory: :al_east
  end

  factory :mets, class: Team do
    city "New York"
    name "Mets"
    association :division, factory: :nl_east
  end
end
