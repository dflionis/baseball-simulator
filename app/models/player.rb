class Player < ActiveRecord::Base
  belongs_to :team

  has_many :player_positions
  has_many :positions, through: :player_positions

  before_save :valid_outcomes_json?

  validates :team, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :batting_hand, presence: true
  validates :stealing, presence: true
  validates :running, presence: true
  validates :vs_lhp, presence: true
  validates :vs_rhp, presence: true
  validates :avg, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :ab, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :doubles, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :triples, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :hr, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :rbi, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :bb, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :so, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :sb, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :cs, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :slg, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :obp, presence: true, numericality: { greater_than_or_equal_to: 0 }

  enum batting_hand: {
    "R" => "R",
    "L" => "L", 
    "S" => "S"
  }

  enum stealing: {
    "AA" => "AA", 
    "A" => "A", 
    "B" => "B", 
    "C" => "C",
    "D" => "D",
    "E" => "E"
  }

  enum running: {
    "1-19" => "1-19", 
    "1-18" => "1-18", 
    "1-17" => "1-17", 
    "1-16" => "1-16", 
    "1-15" => "1-15",
    "1-14" => "1-14",
    "1-13" => "1-13",
    "1-12" => "1-12", 
    "1-11" => "1-11", 
    "1-10" => "1-10",
    "1-9" => "1-9", 
    "1-8" => "1-8", 
    "1-7" => "1-7", 
    "1-6" => "1-6", 
    "1-5" => "1-5", 
    "1-4" => "1-4",
    "1-3" => "1-3",
    "1-2" => "1-2"
  }

  private

  def valid_outcomes_json?
    valid_vs_lhp_keys? && valid_vs_rhp_keys?
  end

  def valid_vs_lhp_keys?
    if vs_lhp.keys == %w(1 2 3) &&
      vs_lhp["1"].keys == ("2".."12").to_a &&
      vs_lhp["2"].keys == ("2".."12").to_a &&
      vs_lhp["3"].keys == ("2".."12").to_a
        true
    else
      false
    end
  end

  def valid_vs_rhp_keys?
    if vs_rhp.keys == %w(1 2 3) &&
      vs_rhp["1"].keys == ("2".."12").to_a &&
      vs_rhp["2"].keys == ("2".."12").to_a &&
      vs_rhp["3"].keys == ("2".."12").to_a
        true
    else
      false
    end
  end
end
