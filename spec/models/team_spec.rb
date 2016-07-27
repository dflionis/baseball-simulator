require "rails_helper"

RSpec.describe Team do
  let(:al_east) { create(:al_east) }

  subject { Team.new(division: al_east, city: "Boston", name: "Red Sox", abbreviation: "BOS") }

  it { should belong_to(:division) }

  it { should have_many(:players) }
  it { should have_many(:pitchers) }

  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:division) }
  it { should validate_presence_of(:abbreviation) }

  it { should validate_uniqueness_of(:name) }
  it { should validate_uniqueness_of(:abbreviation) }

  describe "#full_name" do
    it "correctly displays the full team name" do
      expect(subject.full_name).to eq("Boston Red Sox")
    end
  end

  describe "#default_lineup" do
    let(:mookie) { create(:mookie_betts) }
    let(:shadow_mookie) { create(:mookie_betts, team: create(:dodgers)) }
    let(:cf) { create(:center_field) }
    let(:catcher) { create(:catcher) }

    before do
      allow_any_instance_of(DefaultLineupSlot).to receive(:player_can_play_position).and_return(true)
      allow_any_instance_of(DefaultLineupSlot).to receive(:player_plays_for_team).and_return(true)
      DefaultLineupSlot.create!(
        team: subject,
        player: mookie,
        position: cf,
        slot: 3
      )
      DefaultLineupSlot.create!(
        team: subject,
        player: shadow_mookie,
        position: catcher,
        slot: 1
      )
    end

    subject { Team.new(id: 1) }

    it "returns player objects in the correct order" do
      expect(subject.default_lineup).to eq([shadow_mookie, mookie])
    end
  end

  describe "#load_default_lineup" do
    let(:game) { create(:scheduled_game) }
    let(:todays_lineup) { [] }
    let(:mookie) { create(:mookie_betts) }
    let(:shadow_mookie) { create(:mookie_betts, team: create(:mets)) }
    let(:expected_lineup) { [shadow_mookie, mookie] }

    before do
      allow_any_instance_of(DefaultLineupSlot).to receive(:player_can_play_position).and_return(true)
      allow_any_instance_of(DefaultLineupSlot).to receive(:player_plays_for_team).and_return(true)
      DefaultLineupSlot.create!(
        team: game.home_team,
        player: mookie,
        position: create(:center_field),
        slot: 2 
      )

      DefaultLineupSlot.create!(
        team: game.home_team,
        player: shadow_mookie,
        position: create(:catcher),
        slot: 1 
      )
    end

    subject { game.home_team }

    it "loads the default lineup as the game lineup and returns the players" do
      expect(subject.load_default_lineup(game: game , home: true)).to eq(expected_lineup)
    end
  end
end
