require "rails_helper"

RSpec.describe Season do
  subject do
    Season.new(
      name: "Test Season"
    )
  end

  it { should have_many(:games) }
  it { should validate_presence_of(:name) }
  it { should define_enum_for(:status).with(%i(scheduled in_progress final)) }

  describe "#play" do
    before { subject.play! }

    it "sets the season status to 'final' upon completion" do
      expect(subject.status).to eq("final")
    end
  end

  describe "#set_default_values" do
    it "sets the appropriate default values" do
      expect(subject.status).to eq("scheduled")
    end
  end
end
