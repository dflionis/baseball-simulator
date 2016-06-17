require "rails_helper"

RSpec.describe Inning do
  let(:game) { create(:scheduled_game) }

  subject(:top_of_1st) do
    Inning.new(
      game: game,
      half: Inning.halves["top"],
      status: Inning.statuses["completed"],
      number: 1,
      runs: 0
    )
  end

  it { should belong_to(:game) }

  it { should define_enum_for(:half).with(%i(top bottom)) }
  it { should define_enum_for(:status).with(%i(in_progress completed)) }

  it { should validate_presence_of(:game) }
  it { should validate_presence_of(:number) }
  it { should validate_presence_of(:half) }
  it { should validate_presence_of(:status) }

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
end
