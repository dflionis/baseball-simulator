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
end
