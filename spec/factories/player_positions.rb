FactoryGirl.define do
  factory :betts_cf, class: PlayerPosition do
    association :player, factory: :mookie_betts
    association :position, factory: :center_field
    fielding_rating "2"
    frequency 1
  end
end
