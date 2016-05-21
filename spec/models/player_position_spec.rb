require "rails_helper"

RSpec.describe PlayerPosition do
  let(:betts) { create(:mookie_betts) }
  let(:center_field) { create(:center_field) }

  subject do
    PlayerPosition.new(
      player: betts,
      position: center_field,
      fielding_rating: "2",
      frequency: 1
    )
  end

  it { should belong_to(:player) }
  it { should belong_to(:position) }

  it { should validate_presence_of(:player) }
  it { should validate_presence_of(:position) }
  it { should validate_presence_of(:fielding_rating) }
  it { should validate_presence_of(:frequency) }

  it { should validate_uniqueness_of(:player).scoped_to(:position_id) }
end
