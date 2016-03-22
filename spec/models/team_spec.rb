require "rails_helper"

RSpec.describe Team do
  let(:al_east) { create(:al_east) }

  subject { Team.new(division: al_east, city: "Boston", name: "Red Sox") }

  it { should belong_to(:division) }

  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:division) }

  describe "#full_name" do
    it "correctly displays the full team name" do
      expect(subject.full_name).to eq("Boston Red Sox")
    end
  end
end
