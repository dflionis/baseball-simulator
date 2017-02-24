class GameLineupSlot < ActiveRecord::Base
  belongs_to :game
  belongs_to :player
  belongs_to :position

  enum team: [:away, :home]

  validates :game, presence: true
  validates :player, presence: true
  validates :team, presence: true
  validates :slot, presence: true
  validates :position, presence: true

  validates :player, uniqueness: { scope: :game_id }
  validates :position, uniqueness: { scope: [:game_id, :team] }
  validates :slot, uniqueness: { scope: [:game_id, :team] }

  validates :slot, numericality: { greater_than_or_equal_to: 1 }
  validates :slot, numericality: { less_than_or_equal_to: 9 }
end
