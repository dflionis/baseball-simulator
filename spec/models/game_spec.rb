require "rails_helper"

RSpec.describe Game do
  let(:red_sox) { create(:red_sox) }
  let(:mets) { create(:mets) }

  subject do
    Game.new(
      away_team: mets,
      home_team: red_sox,
      status: :scheduled,
      start_time: Time.now
    )
  end

  it { should belong_to(:away_team) }
  it { should belong_to(:home_team) }

  it { should have_many(:innings) }

  it { should define_enum_for(:status).with([:scheduled, :in_progress, :final]) }

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
        status: :final,
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
        status: :scheduled,
        start_time: Time.now
      )
    end

    it "prevents the game from being saved" do
      expect { subject.save! }.to raise_error("We currently do not support mirror matches")
    end
  end

  context "deleting games" do
    before { create(:top_of_the_first) }

    it "deletes children innings when a game is deleted" do
      expect(Inning.count).to eq(1)
      Game.destroy_all
      expect(Inning.count).to eq(0)
    end
  end

  describe "#print_line_score" do
    context "Extra Inning Game" do
      let(:warning) { "We need to implement extra inning flexible line scores!" }
      let(:line_break) { "\n" }

      before { allow(subject).to receive_message_chain(:innings, :completed, :count).and_return(24) }

      it "warns that it will not print a line score" do
        expect { subject.print_line_score  }.to output(warning + line_break).to_stdout
      end
    end

    context "9 Inning Game" do
      let(:line1) { "Team  1  2  3  4  5  6  7  8  9  R  H  E"}
      let(:line2) { "NYM   0  0  0  0  0  0  0  0  0  0  ?  ?"}
      let(:line3) { "BOS   0  0  0  0  0  0  0  1  X  1  ?  ?"}
      let(:expected_output) { line1 + "\n" + line2 + "\n" + line3 + "\n" }

      before do
        subject.save!
        subject.innings.create(number: 1, half: Inning.halves["top"], status: Inning.statuses["completed"], runs: 0 )
        subject.innings.create(number: 1, half: Inning.halves["bottom"], status: Inning.statuses["completed"], runs: 0 )
        subject.innings.create(number: 2, half: Inning.halves["top"], status: Inning.statuses["completed"], runs: 0 )
        subject.innings.create(number: 2, half: Inning.halves["bottom"], status: Inning.statuses["completed"], runs: 0 )
        subject.innings.create(number: 3, half: Inning.halves["top"], status: Inning.statuses["completed"], runs: 0 )
        subject.innings.create(number: 3, half: Inning.halves["bottom"], status: Inning.statuses["completed"], runs: 0 )
        subject.innings.create(number: 4, half: Inning.halves["top"], status: Inning.statuses["completed"], runs: 0 )
        subject.innings.create(number: 4, half: Inning.halves["bottom"], status: Inning.statuses["completed"], runs: 0 )
        subject.innings.create(number: 5, half: Inning.halves["top"], status: Inning.statuses["completed"], runs: 0 )
        subject.innings.create(number: 5, half: Inning.halves["bottom"], status: Inning.statuses["completed"], runs: 0 )
        subject.innings.create(number: 6, half: Inning.halves["top"], status: Inning.statuses["completed"], runs: 0 )
        subject.innings.create(number: 6, half: Inning.halves["bottom"], status: Inning.statuses["completed"], runs: 0 )
        subject.innings.create(number: 7, half: Inning.halves["top"], status: Inning.statuses["completed"], runs: 0 )
        subject.innings.create(number: 7, half: Inning.halves["bottom"], status: Inning.statuses["completed"], runs: 0 )
        subject.innings.create(number: 8, half: Inning.halves["top"], status: Inning.statuses["completed"], runs: 0 )
        subject.innings.create(number: 8, half: Inning.halves["bottom"], status: Inning.statuses["completed"], runs: 1 )
        subject.innings.create(number: 9, half: Inning.halves["top"], status: Inning.statuses["completed"], runs: 0 )
      end

      it "prints a line score" do
        expect { subject.print_line_score  }.to output(expected_output).to_stdout
      end
    end
  end

  describe "#going_final?" do
    context "when the game is already final" do
      subject do
        Game.new(
          away_team: mets,
          home_team: red_sox,
          status: :final,
          start_time: Time.now
        )
      end

      it "returns nil" do
        expect(subject.going_final?).to be_nil
      end
    end

    context "if the game is tied" do
      subject do
        Game.new(
          away_team: mets,
          home_team: red_sox,
          status: :in_progress,
          start_time: Time.now,
          away_score: 4,
          home_score: 4
        )
      end

      it "returns false" do
        expect(subject.going_final?).to be false
      end
    end

    context "if the top of the 9th is not yet completed" do
      let(:innings) { double(completed: completed) }
      let(:completed) { double(count: count) }
      let(:count) { 3 }

      before do
        allow(subject).to receive(:innings).and_return(innings)
      end

      subject do
        Game.new(
          away_team: mets,
          home_team: red_sox,
          status: :in_progress,
          start_time: Time.now,
          away_score: 0,
          home_score: 7
        )
      end

      it "returns false" do
        expect(subject.going_final?).to be false
      end
    end

    context "if the top of the 9th is completed and the home team is ahead" do
      let(:innings) { double(completed: completed) }
      let(:completed) { double(count: count) }
      let(:count) { 17 }

      before do
        allow(subject).to receive(:innings).and_return(innings)
        allow(subject).to receive(:end_game).and_return(true)
      end

      subject do
        Game.new(
          away_team: mets,
          home_team: red_sox,
          status: :in_progress,
          start_time: Time.now,
          away_score: 0,
          home_score: 3
        )
      end

      it "ends the game and returns true" do
        expect(subject.going_final?).to be true
        expect(subject).to have_received(:end_game)
      end
    end

    context "if 9 innings are complete, the road team leads, the home team has gotten equal at bats" do
      let(:innings) { double(completed: completed, count: 20) }
      let(:completed) { double(count: count) }
      let(:count) { 20 }

      before do
        allow(subject).to receive(:innings).and_return(innings)
        allow(subject).to receive(:end_game).and_return(true)
      end

      subject do
        Game.new(
          away_team: mets,
          home_team: red_sox,
          status: :in_progress,
          start_time: Time.now,
          away_score: 7,
          home_score: 2
        )
      end

      it "ends the game and returns true" do
        expect(subject.going_final?).to be true
        expect(subject).to have_received(:end_game)
      end
    end

    context "if the away team is winning but the home team hasn't come up to bat in the bottom of the inning" do
      let(:innings) { double(completed: completed, count: 21) }
      let(:completed) { double(count: count) }
      let(:count) { 21 }

      before do
        allow(subject).to receive(:innings).and_return(innings)
      end

      subject do
        Game.new(
          away_team: mets,
          home_team: red_sox,
          status: :in_progress,
          start_time: Time.now,
          away_score: 5,
          home_score: 1
        )
      end

      it "returns false" do
        expect(subject.going_final?).to be false
      end
    end

    context "if we're in extra innings, the away team leads but hasn't finished their half inning" do
      let(:innings) { double(completed: completed, count: 21) }
      let(:completed) { double(count: count) }
      let(:count) { 20 }

      before do
        allow(subject).to receive(:innings).and_return(innings)
      end

      subject do
        Game.new(
          away_team: mets,
          home_team: red_sox,
          status: :in_progress,
          start_time: Time.now,
          away_score: 5,
          home_score: 1
        )
      end
      it "ends the game and returns true" do
        expect(subject.going_final?).to be false
      end
    end
  end

  describe "#away_pitcher" do
    let!(:sabathia) { FactoryGirl.create(:cc_sabathia, team: FactoryGirl.create(:dodgers)) }

    it "selects Rick Porcello as the home pitcher" do
      expect(subject.away_pitcher).to eq(sabathia)
    end
  end

  describe "#home_pitcher" do
    let!(:porcello) { FactoryGirl.create(:rick_porcello, team: FactoryGirl.create(:dodgers)) }

    it "selects Rick Porcello as the home pitcher" do
      expect(subject.home_pitcher).to eq(porcello)
    end
  end

  describe "#increment_away_hitter_index" do
    it "increments the away hitter index properly" do
      (0..8).to_a.push(0).each do |expected_index|
        expect(subject.increment_away_hitter_index).to eq(expected_index)
      end
    end
  end

  describe "#increment_home_hitter_index" do
    it "increments the away hitter index properly" do
      (0..8).to_a.push(0).each do |expected_index|
        expect(subject.increment_home_hitter_index).to eq(expected_index)
      end
    end
  end

  describe "#lineups" do
    let(:away_lineup) { %w(foo bar baz) }
    let(:home_lineup) { %w(qux quux corge) }
    let(:expected_lineup_hash) { { away_lineup: away_lineup, home_lineup: home_lineup } }

    before do
      allow(subject.away_team).to receive(:load_default_lineup).with({ game: subject, home: false }).and_return(away_lineup)
      allow(subject.home_team).to receive(:load_default_lineup).with({ game: subject, home: true }).and_return(home_lineup)
    end

    it "returns a hash with both away and home lineups" do
      subject.save!
      expect(subject.lineups).to eq(expected_lineup_hash)
    end
  end
end
