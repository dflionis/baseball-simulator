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
    let(:league) { FactoryGirl.create(:american_league) }
    let(:outcome) { FactoryGirl.create(:home_run) }
    let(:cf) { FactoryGirl.create(:center_field) }
    let(:al_east) { FactoryGirl.create(:al_east, league: league) }
    let(:red_sox) { FactoryGirl.create(:red_sox, division: al_east) }
    let(:yankees) { FactoryGirl.create(:yankees, division: al_east) }
    let(:game) { FactoryGirl.create(:scheduled_game, away_team: red_sox, home_team: yankees) }
    let(:mookie_betts) { FactoryGirl.create(:mookie_betts, team: red_sox) }
    let(:cc_sabathia) { FactoryGirl.create(:cc_sabathia, team: yankees) }

    let(:inning) { FactoryGirl.create(:top_of_the_first, game: game) }
    let(:game_lineup_slot) do
      FactoryGirl.create(
        :game_lineup_slot,
        game: game,
        player: mookie_betts,
        position: cf,
        team: :away,
        slot: 1
      )
    end

    before  { allow(Outcome).to receive(:find_by).with(any_args).and_return(outcome) }

    subject do
      PlateAppearance.new(
        inning: inning,
        pitcher: cc_sabathia,
        batter: game_lineup_slot
      )
    end

    it "determines an outcome before creation" do
      subject.save!
      expect(subject.outcome).to eq(outcome)
    end 
  end
end
