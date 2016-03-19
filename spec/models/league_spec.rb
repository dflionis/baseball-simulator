require "rails_helper"

RSpec.describe League do
  describe "validations" do
    subject { League.new(name: "American League", dh: true) }

    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_inclusion_of(:dh).in_array([true, false]) }
  end
end