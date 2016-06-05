class Pitcher < ActiveRecord::Base
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
    valid_vs_lhb_keys? && valid_vs_rhb_keys?
  end

  def valid_vs_lhb_keys?
    if vs_lhb.keys == %w(4 5 6) &&
      vs_lhb["4"].keys == ("2".."12").to_a &&
      vs_lhb["5"].keys == ("2".."12").to_a &&
      vs_lhb["6"].keys == ("2".."12").to_a
        true
    else
      false
    end
  end

  def valid_vs_rhb_keys?
    if vs_rhb.keys == %w(4 5 6) &&
      vs_rhb["4"].keys == ("2".."12").to_a &&
      vs_rhb["5"].keys == ("2".."12").to_a &&
      vs_rhb["6"].keys == ("2".."12").to_a
        true
    else
      false
    end
  end
end
