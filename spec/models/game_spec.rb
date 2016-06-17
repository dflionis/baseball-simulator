require "rails_helper"

RSpec.describe Game do
  let(:red_sox) { create(:red_sox) }
  let(:mets) { create(:mets) }

  subject do
    Game.new(
      away_team: mets,
      home_team: red_sox,
      game_status: :scheduled,
      start_time: Time.now
    )
  end

  it { should belong_to(:away_team) }
  it { should belong_to(:home_team) }

  it { should have_many(:innings) }

  it { should define_enum_for(:game_status).with([:scheduled, :in_progress, :final]) }

  it { should validate_presence_of(:away_team) }
  it { should validate_presence_of(:home_team) }
  it { should validate_presence_of(:start_time) }

  context "game is scheduled" do
    before do
      allow(subject).to receive(:scheduled?).and_return(true)
    end

    it "nils out any attempt to set a current_inning" do
      subject.current_inning = 5
      subject.save!
      expect(subject.current_inning).to be_nil
    end
  end

  context "game is in progress" do
    before do
      allow(subject).to receive(:in_progress?).and_return(true)
    end

    it { should validate_presence_of(:current_inning) } 

    it { should validate_numericality_of(:away_score).is_greater_than_or_equal_to(0) } 
    it { should validate_numericality_of(:home_score).is_greater_than_or_equal_to(0) }
    it { should validate_numericality_of(:current_inning).is_greater_than_or_equal_to(1) }
  end

  context "game is final" do
    subject do
      Game.new(
        away_team: mets,
        home_team: red_sox,
        game_status: :final,
        start_time: Time.now - 1.day,
        away_score: 6,
        home_score: 5
      )
    end

    it { should validate_numericality_of(:away_score).is_greater_than_or_equal_to(0) } 
    it { should validate_numericality_of(:home_score).is_greater_than_or_equal_to(0) } 

    it "nils out any attempt to set a current_inning" do
      subject.current_inning = 1
      subject.save!
      expect(subject.current_inning).to be_nil
    end
  end

  context "mirror match" do
    subject do
      Game.new(
        away_team: red_sox,
        home_team: red_sox,
        game_status: :scheduled,
        start_time: Time.now
      )
    end

    it "prevents the game from being saved" do
      expect { subject.save! }.to raise_error("We currently do not support mirror matches")
    end
  end
end
