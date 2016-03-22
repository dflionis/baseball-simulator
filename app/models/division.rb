class Division < ActiveRecord::Base
  belongs_to :league
  has_many :teams

  enum region: %w(East Central West)

  validates :region, presence: true, uniqueness:  { scope: :league_id }
  validates :league, presence: true

  def name
    league.name + " " + region
  end
end
