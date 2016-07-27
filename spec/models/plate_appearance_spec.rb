require "rails_helper"

RSpec.describe PlateAppearance do
  it { should belong_to(:inning) }
  it { should belong_to(:pitcher) }
  it { should belong_to(:batter) }
  it { should belong_to(:outcome) }
  it { should belong_to(:runner_on_first) }
  it { should belong_to(:runner_on_second) }
  it { should belong_to(:runner_on_third) }

  it { should validate_presence_of(:inning) }
  it { should validate_presence_of(:pitcher) }
  it { should validate_presence_of(:batter) }

  describe "#play_out_at_bat" do
    let(:inning) { FactoryGirl.create(:top_of_the_first) }
    let(:pitcher) { FactoryGirl.create(:cc_sabathia) }
    let(:batter) { FactoryGirl.create(:mookie_betts) }
    let(:outcome) { FactoryGirl.create(:home_run) }

    before  { allow(Outcome).to receive(:find_by).with(any_args).and_return(outcome) }

    subject do
      PlateAppearance.new(
        inning: inning,
        pitcher: pitcher,
        batter: batter
      )
    end

    it "determines an outcome before creation" do
      subject.save!
      expect(subject.outcome).to eq(outcome)
    end 
  end
end
