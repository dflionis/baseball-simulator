class Division < ApplicationRecord
  belongs_to :league
  has_many :teams

  enum region: {
    east: "East",
    central: "Central",
    west: "West"
  }

  validates :region, presence: true, uniqueness:  { scope: :league_id }
  validates :league, presence: true

  def name
    league.name + " " + region.capitalize
  end
end
