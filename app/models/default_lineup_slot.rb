class DefaultLineupSlot < ApplicationRecord
  belongs_to :team
  belongs_to :player
  belongs_to :position

  validates :team, presence: true
  validates :player, presence: true, uniqueness: { scope: :team_id }
  validates :position, presence: true, uniqueness: { scope: :team_id }
  validates :slot, presence: true, uniqueness: { scope: :team_id }

  validates :slot, numericality: { greater_than_or_equal_to: 1 }
  validates :slot, numericality: { less_than_or_equal_to: 9 }

  validate :player_can_play_position, :player_plays_for_team

  private

  def player_can_play_position
    if player && player.player_positions.where(position: position).any?
      # OK
    elsif position == Position.find_by(abbreviation: "DH")
      # OK --> anyone can DH
    else
      errors.add(:position, "The player must be eligible to play the position")
    end
  end

  def player_plays_for_team
    if player && self.team == player.team
      # OK
    else
      errors.add(:player, "The player must play for the team!")
    end
  end
end
