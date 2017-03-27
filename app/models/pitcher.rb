class Pitcher < ApplicationRecord
  belongs_to :team

  before_save :valid_outcomes_json?

  validates :team, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :pitcher_type, presence: true
  validates :throws, presence: true
  validates :vs_lhb, presence: true
  validates :vs_rhb, presence: true
  validates :batting_rating, presence: true
  validates :wins, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :losses, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :era, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :starts, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :saves, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :innings_pitched, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :hits_allowed, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :bb, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :so, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :hr_allowed, presence: true, numericality: { greater_than_or_equal_to: 0 }

  enum throws: {
    "R" => "R",
    "L" => "L"
  }

  enum batting_rating: {
    "1" => "1",
    "2" => "2",
    "3" => "3",
    "4" => "4",
    "5" => "5"
  }

  enum pitcher_type: {
    "SP" => "SP",
    "RP" => "RP",
    "SP/RP" => "SP/RP",
    "RP/SP" => "RP/SP"
  }

  private

  def valid_outcomes_json?
    (valid_vs_lhb_keys? && valid_vs_rhb_keys? &&
      valid_vs_lhb_ranges? && valid_vs_rhb_ranges?) ||
      throw(:abort)
  end

  def valid_vs_lhb_keys?
    OutcomesDigging.validate_red_and_white_dice_values(vs_lhb, self.class)
  end

  def valid_vs_rhb_keys?
    OutcomesDigging.validate_red_and_white_dice_values(vs_rhb, self.class)
  end

  def valid_vs_lhb_ranges?
    OutcomesDigging::validate_20_sided_die_ranges(vs_lhb)
  end

  def valid_vs_rhb_ranges?
    OutcomesDigging::validate_20_sided_die_ranges(vs_rhb)
  end
end
