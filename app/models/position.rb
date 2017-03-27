class Position < ApplicationRecord
  has_many :player_positions
  has_many :players, through: :player_positions

  validates :name, presence: true, uniqueness: true
  validates :abbreviation, presence: true
  validates :scorebook_id, presence: true
end
