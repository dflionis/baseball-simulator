class Game < ActiveRecord::Base
  belongs_to :away_team, class_name: "Team"
  belongs_to :home_team, class_name: "Team"

  has_many :innings

  enum game_status: [:scheduled, :in_progress, :final]

  validates :away_team, presence: true
  validates :home_team, presence: true
  validates :start_time, presence: true

  validates :away_score, numericality: { greater_than_or_equal_to: 0 },
    if: :in_progress?
  validates :away_score, numericality: { greater_than_or_equal_to: 0 },
    if: :final?
  validates :home_score, numericality: { greater_than_or_equal_to: 0 },
    if: :in_progress?
  validates :home_score, numericality: { greater_than_or_equal_to: 0 },
    if: :final?
  validates :current_inning, presence: true, numericality: { greater_than_or_equal_to: 1 },
    if: :in_progress?

  before_save :sync_current_inning_with_game_status, :prevent_mirror_matches

  private

  def sync_current_inning_with_game_status
    self.current_inning = nil if self.final? || self.scheduled?
  end

  def prevent_mirror_matches
    raise "We currently do not support mirror matches" if self.away_team == self.home_team
  end
end
