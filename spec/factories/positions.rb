FactoryGirl.define do
  factory :catcher, class: Position do
    name "Catcher"
    abbreviation "C"
    scorebook_id "2"
  end

  factory :center_field, class: Position do
    name "Center Field"
    abbreviation "CF"
    scorebook_id "8"
  end

  factory :designated_hitter, class: Position do
    name "Designated Hitter"
    abbreviation "DH"
    scorebook_id "DH"
  end
end
