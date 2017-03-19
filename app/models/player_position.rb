class PlayerPosition < ApplicationRecord
  belongs_to :player
  belongs_to :position

  validates :player, presence: true, uniqueness: { scope: :position_id }
  validates :position, presence: true
  validates :fielding_rating, presence: true
  validates :frequency, presence: true

  enum fielding_rating: {
    "1" => "1",
    "2" => "2",
    "3" => "3",
    "4" => "4",
    "5" => "5",
  }
end
