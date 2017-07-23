require "rails_helper"

RSpec.describe Outcome do
  it { should validate_presence_of(:code) }

  it { should have_many(:plate_appearances) }

  it { should have_db_index(:code) }

  describe "default_values" do
    let(:false_statistics) { %i(h bb so double triple hr) }
    let(:true_statistics) { %i(ab) }

    it "sets the correct default value if none are provided" do
      false_statistics.each do |stat|
        expect(subject.send(stat)).to eq(false)
      end
      true_statistics.each do |stat|
        expect(subject.send(stat)).to eq(true)
      end
    end
  end
end
