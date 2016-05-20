require "rails_helper"

RSpec.describe Position do
  it { should have_many(:player_positions) }
  it { should have_many(:players).through(:player_positions) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:abbreviation) }
  it { should validate_presence_of(:scorebook_id) }

  it do
    FactoryGirl.create(:catcher)
    should validate_uniqueness_of(:name)
  end
end
