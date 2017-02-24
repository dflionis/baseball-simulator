require "rails_helper"

RSpec.describe DefaultLineupSlot do
  let(:mookie) { create(:mookie_betts) }
  let(:cf) { create(:center_field) }

  subject do
    DefaultLineupSlot.new(
      player: mookie,
      team: mookie.team,
      position: cf,
      slot: 1
    )
  end

  it { should belong_to(:team) }
  it { should belong_to(:player) }
  it { should belong_to(:position) }

  it { should have_db_index([:team_id, :player_id]).unique(true) }
  it { should have_db_index([:team_id, :slot]).unique(true) }
  it { should have_db_index([:team_id, :position_id]).unique(true) }

  it { should validate_presence_of(:player) }
  it { should validate_presence_of(:team) }
  it { should validate_presence_of(:position) }
  it { should validate_presence_of(:slot) }

  it { should validate_uniqueness_of(:slot).scoped_to(:team_id) }
  it { should validate_uniqueness_of(:position).scoped_to(:team_id) }
  it { should validate_uniqueness_of(:player).scoped_to(:team_id) }

  it { should validate_numericality_of(:slot).is_greater_than_or_equal_to(1) }
  it { should validate_numericality_of(:slot).is_less_than_or_equal_to(9) }

  describe "player-to-position validation" do
    before do
      PlayerPosition.create!(
        player: mookie,
        position: cf,
        fielding_rating: "2",
        frequency: 1,
      )
    end

    describe "player playing a valid position" do
      it "allows the player to play that position" do
        expect(subject).to be_valid
      end
    end
  
    describe "player playing an invalid position" do
      let(:c) { create(:catcher) }

      subject do
        DefaultLineupSlot.new(
          player: mookie,
          team: mookie.team,
          position: c,
          slot: 1
        )
      end 

      it "does not allow the player to play that position" do
        expect(subject).not_to be_valid
      end
    end

    describe "player playing designated hitter" do
      let(:dh) { create(:designated_hitter) }

      subject do
        DefaultLineupSlot.new(
          player: mookie,
          team: mookie.team,
          position: dh,
          slot: 1
        )
      end 

      it "allows the player to play that position" do
        expect(subject).to be_valid
      end
    end
  end

  describe "player-to-team validation" do
    subject do
      DefaultLineupSlot.new(
        player: mookie,
        team: create(:mets),
        position: cf,
        slot: 1
      )
    end

    it "does not allow a player from a different team into the lineup" do
      expect(subject).not_to be_valid
    end
  end
end
