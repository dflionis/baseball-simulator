require "rails_helper"

RSpec.describe GameLineupSlot do
  let(:game) { create(:scheduled_game) }
  let(:cf) { create(:center_field) }
  let(:mookie) { create(:mookie_betts) }

  subject do
    GameLineupSlot.new(
      game: game,
      player: mookie,
      team: GameLineupSlot.teams[:away],
      slot: 1,
      position: cf
    )
  end

  it { should belong_to(:game) }
  it { should belong_to(:player) }
  it { should belong_to(:position) }

  it { should define_enum_for(:team).with(%i(away home)) }

  it { should validate_presence_of(:game) }
  it { should validate_presence_of(:player) }
  it { should validate_presence_of(:team) }
  it { should validate_presence_of(:slot) }
  it { should validate_presence_of(:position) }

  it { should validate_uniqueness_of(:player).scoped_to(:game_id) }
  it { should validate_uniqueness_of(:position).scoped_to([:game_id, :team]) }
  it { should validate_uniqueness_of(:slot).scoped_to([:game_id, :team]) }

  it { should validate_numericality_of(:slot).is_greater_than_or_equal_to(1) }
  it { should validate_numericality_of(:slot).is_less_than_or_equal_to(9) }
end
