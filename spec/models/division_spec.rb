require "rails_helper"

RSpec.describe Division do
  let(:american_league) { create(:american_league) }

  subject { Division.new(region: "East", league: american_league) }

  it { should belong_to(:league) }

  it { should validate_presence_of(:region) }
  it { should validate_presence_of(:league) }

  # FIXME: This does not appear to play nicely with enums--find alternative way to test it
  # it { should validate_uniqueness_of(:region).scoped_to(:league_id) }

  describe "#name" do
    it "states the full division name correctly" do
      expect(subject.name).to eq("American League East")
    end
  end
end
