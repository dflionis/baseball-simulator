FactoryGirl.define do
  factory :red_sox, class: Team do
    city "Boston"
    name "Red Sox"
    association :division, factory: :al_east
  end
end
