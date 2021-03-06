require "rails_helper"

RSpec.describe Inning do
  let(:game) { create(:scheduled_game) }

  subject(:top_of_1st) do
    Inning.new(
      game: game,
      half: Inning.halves["top"],
      status: Inning.statuses["completed"],
      number: 1,
      runs: 0,
      outs: 3
    )
  end

  it { should belong_to(:game) }

  it { should have_many(:plate_appearances) }

  it { should define_enum_for(:half).with(%i(top bottom)) }
  it { should define_enum_for(:status).with(%i(in_progress completed)) }

  it { should validate_presence_of(:game) }
  it { should validate_presence_of(:number) }
  it { should validate_presence_of(:half) }
  it { should validate_presence_of(:status) }

  it { should validate_inclusion_of(:outs).in_range(0..3) }

  it { should validate_numericality_of(:number).is_greater_than_or_equal_to(1) }
  it { should validate_numericality_of(:runs).is_greater_than_or_equal_to(0) }

  describe "game/number/half uniqueness constraint" do
    context "when the combination is unique" do
      it "saves the record" do
        expect { top_of_1st.save! }.to_not raise_error
      end
    end

    context "when the combination is not unique" do
      let(:duplicate_record) {
        Inning.new(
          game: game,
          half: :top,
          status: :in_progress,
          number: 1,
          runs: 1
        )
      }

      it "does not save the record" do
        top_of_1st.save!
        expect { duplicate_record.save! }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end

  describe "inning sequence" do
    context "when its the top of the first inning" do
      it "saves the inning" do
        expect { top_of_1st.save! }.to_not raise_error
      end
    end

    context "when its the bottom of the inning and the top of the inning exists" do
      let(:bottom_of_1st) {
        Inning.new(
          game: game,
          half: :bottom,
          status: :in_progress,
          number: 1,
          runs: 0
        )
      }

      it "saves the inning" do
        top_of_1st.save!
        expect { bottom_of_1st.save! }.to_not raise_error
      end
    end

    context "when its the bottom of the inning and the top of the inning does not exist" do
      let(:bottom_of_1st) {
        Inning.new(
          game: game,
          half: :bottom,
          status: :in_progress,
          number: 1,
          runs: 0
        )
      }

      it "does not save the inning" do
        expect { bottom_of_1st.save! }.to raise_error("incorrect inning sequence")
      end
    end

    context "when its the top of the inning and the bottom of the previous inning exists" do
      let(:bottom_of_1st) {
        Inning.new(
          game: game,
          half: :bottom,
          status: :completed,
          number: 1,
          runs: 0
        )
      }
      let(:top_of_2nd) {
        Inning.new(
          game: game,
          half: :top,
          status: :in_progress,
          number: 2,
          runs: 0
        )
      }

      it "saves the inning" do
        top_of_1st.save!
        bottom_of_1st.save!
        expect { top_of_2nd.save! }.to_not raise_error
      end
    end

    context "when its the top of the inning and the bottom of the previous inning does not exist" do
      let(:top_of_2nd) {
        Inning.new(
          game: game,
          half: :top,
          status: :in_progress,
          number: 2,
          runs: 0
        )
      }

      it "does not save the inning" do
        top_of_1st.save!
        expect { top_of_2nd.save! }.to raise_error("incorrect inning sequence")
      end
    end
  end

  describe "#add_one_out" do
    context "when there are less than 3 outs" do
      subject do
        Inning.create!(
          game: game,
          half: Inning.halves["top"],
          status: Inning.statuses["in_progress"],
          number: 1,
          runs: 0,
          outs: 0
        )
      end

      it "increases the out count by one" do
        subject.add_one_out
        expect(subject.outs).to eq(1)
      end
    end

    context "when there are 3 outs" do
      it "raises an error indicating there are already 3 outs" do
        expect { subject.add_one_out }.to raise_error("There are already 3 outs")
      end
    end
  end

  describe "#add_two_outs" do
    context "when there are less than 2 outs" do
      subject do
        Inning.create!(
          game: game,
          half: Inning.halves["top"],
          status: Inning.statuses["in_progress"],
          number: 1,
          runs: 0,
          outs: 0
        )
      end

      it "increases the out count by two" do
        subject.add_two_outs
        expect(subject.outs).to eq(2)
      end
    end

    context "when there are 2 outs" do
      subject do
        Inning.create!(
          game: game,
          half: Inning.halves["top"],
          status: Inning.statuses["in_progress"],
          number: 1,
          runs: 0,
          outs: 2
        )
      end

      it "increases the out count to three" do
        subject.add_two_outs
        expect(subject.outs).to eq(3)
      end
    end

    context "when there are 3 outs" do
      it "raises an error indicating there are already 3 outs" do
        expect { subject.add_two_outs }.to raise_error("There are already 3 outs")
      end
    end
  end

  describe "#set_default_values" do
    subject { Inning.new }  

    it "sets the appropriate default values" do
      expect(subject.outs).to eq(0)
      expect(subject.runs).to eq(0)
    end
  end

  describe "#update_game_score" do
    before do
      subject.runs = 1      
      subject.save!
    end

    it "correctly updates the score" do
      expect(subject.game.away_score).to eq(1)
      expect(subject.game.home_score).to eq(0)
    end
  end

  describe "#pitcher" do
    let(:home_pitcher) { "Mike" }
    let(:away_pitcher) { "John" }

    context "when the away team is up" do
      before do
        allow(game).to receive(:hitting_team).and_return("away")
        allow(game).to receive(:home_pitcher).and_return(home_pitcher)
      end

      it "returns the home pitcher" do
        expect(subject.pitcher).to eq(home_pitcher)
      end
    end

    context "when the home team is up" do
      before do
        allow(game).to receive(:hitting_team).and_return("home")
        allow(game).to receive(:away_pitcher).and_return(away_pitcher)
      end

      it "returns the away pitcher" do
        expect(subject.pitcher).to eq(away_pitcher)
      end
    end
  end

  describe "#clear_bases" do
    before do
      subject.man_on_first = "Bob"
      subject.man_on_second = "Kevin"
      subject.man_on_third = nil
    end

    it "properly clears the bases" do
      expect(subject.man_on_first).to eq("Bob")
      expect(subject.man_on_second).to eq("Kevin")
      subject.clear_bases
      expect(subject.man_on_first).to be_nil
      expect(subject.man_on_second).to be_nil
      expect(subject.man_on_third).to be_nil
    end
  end

  describe "#two_outs?" do
    before { allow(subject).to receive(:outs).and_return(out_count) }

    context "when there are two outs" do
      let(:out_count) { 2 }

      it "returns true" do
        expect(subject.two_outs?).to eq(true)
      end
    end

    context "when there is some other out count" do
      let(:out_count) { 1 }

      it "returns false" do
        expect(subject.two_outs?).to eq(false)
      end
    end
  end

  describe "#runner_from_third_scores" do
    subject do
      Inning.new(
        game: game,
        half: Inning.halves["top"],
        status: Inning.statuses["in_progress"],
        number: 1,
        runs: 0,
        outs: 1
      )
    end

    context "if nobody is on third" do
      it "does nothing" do
        subject.runner_from_third_scores
        expect(subject.runs).to eq(0)
        expect(subject.man_on_first).to be_nil
        expect(subject.man_on_second).to be_nil
        expect(subject.man_on_third).to be_nil
      end
    end

    context "if a runner is on third" do
      let(:bill) { double }
      let(:frank) { double }

      before do
        allow(bill).to receive(:increment!).with(:r).and_return(true)
        subject.man_on_third = bill
        subject.man_on_second = frank
      end

      it "scores the man on third" do
        subject.runner_from_third_scores
        expect(subject.runs).to eq(1)
        expect(subject.man_on_first).to be_nil
        expect(subject.man_on_second).to eq(frank)
        expect(subject.man_on_third).to be_nil
      end
    end
  end

  describe "#runners_advance_one_base" do
    subject do
      Inning.new(
        game: game,
        half: Inning.halves["top"],
        status: Inning.statuses["in_progress"],
        number: 1,
        runs: 0,
        outs: 1
      )
    end

    context "Nobody is on base" do
      it "does nothing" do
        subject.runners_advance_one_base
        expect(subject.man_on_first).to be_nil
        expect(subject.man_on_second).to be_nil
        expect(subject.man_on_third).to be_nil
      end
    end

    context "There are baserunners" do
      let(:pete) { double }
      let(:babe) { double }
      let(:joe) { double }

      before do
        allow(pete).to receive(:increment!).with(:r).and_return(true)
        subject.man_on_third = pete
        subject.man_on_second = babe
        subject.man_on_first = joe
      end

      it "moves all runners up one base" do
        subject.runners_advance_one_base
        expect(subject.runs).to eq(1)
        expect(subject.man_on_first).to be_nil
        expect(subject.man_on_second).to eq(joe)
        expect(subject.man_on_third).to eq(babe)
      end
    end
  end

  describe "#lineup" do
    let(:lineups) { { away_lineup: away_lineup, home_lineup: home_lineup } }
    let(:away_lineup) { %w(Pete Babe Joe Hank Lefty Willie Jay Jacks Cy) }
    let(:home_lineup) { %w(Foo Bar Baz Qux Quux Quuz Corge Grault Garply) }

    before { allow(game).to receive(:lineups).and_return(lineups) }

    context "when the away team is batting" do
      before { allow(game).to receive(:hitting_team).and_return("away") }

      subject do
        Inning.new(
          game: game,
          half: Inning.halves["top"],
          status: Inning.statuses["in_progress"],
          number: 1,
          runs: 0,
          outs: 0
        )
      end

      it "returns the away lineup" do
        expect(subject.lineup).to eq(away_lineup)
      end
    end

    context "when the home team is batting" do
      before { allow(game).to receive(:hitting_team).and_return("home") }

      subject do
        Inning.new(
          game: game,
          half: Inning.halves["bottom"],
          status: Inning.statuses["in_progress"],
          number: 1,
          runs: 0,
          outs: 0
        )
      end
      it "returns the home lineup" do
        expect(subject.lineup).to eq(home_lineup)
      end
    end
  end

  describe "#play_next_at_bat!" do
    let(:lineup) {%w(Ryder Paste) }
    let(:pitcher) { "Dreyfus" }
    let(:expected_hash) do
      {
        inning: subject,
        pitcher: pitcher,
        batter: "Ryder",
        runner_on_first: nil,
        runner_on_second: "Bay",
        runner_on_third: nil
      }
    end

    before do
      allow(subject).to receive(:lineup).and_return(lineup) 
      allow(subject).to receive(:pitcher).and_return(pitcher) 
      allow(PlateAppearance).to receive(:create!).with(expected_hash).and_return(true)
      allow(subject).to receive(:man_on_second).and_return("Bay")
    end

    it "produces an outcome from the at-bat" do
      expect(PlateAppearance).to receive(:create!).with(expected_hash)
      subject.play_next_at_bat!
    end
  end

  describe "#runners_advance_two_bases" do
    subject do
      Inning.new(
        game: game,
        half: Inning.halves["top"],
        status: Inning.statuses["in_progress"],
        number: 1,
        runs: 0,
        outs: 1
      )
    end

    context "Nobody is on base" do
      it "does nothing" do
        subject.runners_advance_two_bases
        expect(subject.man_on_first).to be_nil
        expect(subject.man_on_second).to be_nil
        expect(subject.man_on_third).to be_nil
        expect(subject.runs).to eq(0)
      end
    end

    context "There are baserunners" do
      let(:pete) { double }
      let(:babe) { double }
      let(:joe) { double }

      before do
        allow(pete).to receive(:increment!).with(:r).and_return(true)
        allow(babe).to receive(:increment!).with(:r).and_return(true)
        subject.man_on_third = pete
        subject.man_on_second = babe
        subject.man_on_first = joe
      end

      it "moves all runners up two bases" do
        subject.runners_advance_two_bases
        expect(subject.runs).to eq(2)
        expect(subject.man_on_first).to be_nil
        expect(subject.man_on_second).to be_nil
        expect(subject.man_on_third).to eq(joe)
      end
    end
  end

  describe "#everyone_scores_except_batter" do
    subject do
      Inning.new(
        game: game,
        half: Inning.halves["top"],
        status: Inning.statuses["in_progress"],
        number: 1,
        runs: 0,
        outs: 1
      )
    end

    context "Nobody is on base" do
      it "does nothing" do
        subject.everyone_scores_except_batter
        expect(subject.runs).to eq(0)
        expect(subject.man_on_first).to be_nil
        expect(subject.man_on_second).to be_nil
        expect(subject.man_on_third).to be_nil
      end
    end

    context "There are baserunners" do
      let(:pete) { double }
      let(:babe) { double }
      let(:joe) { double }

      before do
        allow(pete).to receive(:increment!).with(:r).and_return(true)
        allow(babe).to receive(:increment!).with(:r).and_return(true)
        allow(joe).to receive(:increment!).with(:r).and_return(true)
        subject.man_on_third = pete
        subject.man_on_second = babe
        subject.man_on_first = joe
      end

      it "scores the runners and empties the bases" do
        subject.everyone_scores_except_batter
        expect(subject.runs).to eq(3)
        expect(subject.man_on_first).to be_nil
        expect(subject.man_on_second).to be_nil
        expect(subject.man_on_third).to be_nil
      end
    end 
  end

  describe "#everyone_scores_including_batter" do
    subject do
      Inning.new(
        game: game,
        half: Inning.halves["top"],
        status: Inning.statuses["in_progress"],
        number: 1,
        runs: 0,
        outs: 1
      )
    end

    context "Nobody is on base" do
      it "scores the batter and nobody else" do
        subject.everyone_scores_including_batter
        expect(subject.runs).to eq(1)
        expect(subject.man_on_first).to be_nil
        expect(subject.man_on_second).to be_nil
        expect(subject.man_on_third).to be_nil
      end
    end

    context "There are baserunners" do
      let(:pete) { double }
      let(:babe) { double }
      let(:joe) { double }

      before do
        allow(pete).to receive(:increment!).with(:r).and_return(true)
        allow(babe).to receive(:increment!).with(:r).and_return(true)
        allow(joe).to receive(:increment!).with(:r).and_return(true)
        subject.man_on_third = pete
        subject.man_on_second = babe
        subject.man_on_first = joe
      end

      it "scores the runners and empties the bases" do
        subject.everyone_scores_including_batter
        expect(subject.runs).to eq(4)
        expect(subject.man_on_first).to be_nil
        expect(subject.man_on_second).to be_nil
        expect(subject.man_on_third).to be_nil
      end
    end 
  end

  describe "#at_least_one_runner_forced?" do
    subject do
      Inning.new(
        game: game,
        half: Inning.halves["top"],
        status: Inning.statuses["in_progress"],
        number: 1,
        runs: 0,
        outs: 1
      )
    end

    context "a runner is not on first" do
      it "returns a falsey value" do
        expect(subject.at_least_one_runner_forced?).to be_falsey
      end
    end

    context "a runner is on first" do
      before { subject.man_on_first = "Kelly" }

      it "returns a truthy value" do
        expect(subject.at_least_one_runner_forced?).to be_truthy
      end
    end
  end

  describe "three_outs?" do
    context "when there are 3 outs" do
      subject do
        Inning.new(
          game: game,
          half: Inning.halves["top"],
          status: Inning.statuses["completed"],
          number: 1,
          runs: 0,
          outs: 3
        )
      end

      it "returns true" do
        expect(subject.three_outs?).to eq(true)
      end
    end

    context "when there are less than 3 outs" do
      subject do
        Inning.new(
          game: game,
          half: Inning.halves["top"],
          status: Inning.statuses["in_progress"],
          number: 1,
          runs: 0,
          outs: 2
        )
      end

      it "returns false" do
        expect(subject.three_outs?).to eq(false)
      end
    end
  end
end
