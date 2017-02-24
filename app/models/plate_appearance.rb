class PlateAppearance < ActiveRecord::Base
  belongs_to :inning
  belongs_to :pitcher
  belongs_to :batter, class_name: "Player"
  belongs_to :outcome
  belongs_to :runner_on_first, class_name: "Player"
  belongs_to :runner_on_second, class_name: "Player"
  belongs_to :runner_on_third, class_name: "Player"

  validates :inning, presence: true
  validates :pitcher, presence: true
  validates :batter, presence: true

  before_create :play_out_at_bat

  private

  def play_out_at_bat
    white_dice, red_dice = Dice.roll
    outcome = merge_possible_outcomes[white_dice][red_dice]

    if outcome.is_a?(Hash)
      roll = Dice.roll_20_sided_die
      ranges = outcome.keys
      ranges.each do |range|
        if range.include?("-")
          range_object = Range.new(*range.split("-").map(&:to_i))
        else
          range_object = Range.new(range.to_i, range.to_i)
        end

        outcome = outcome[range] if range_object.include?(roll)
      end
    end

    self.outcome = Outcome.find_by(code: outcome)
  end

  def merge_possible_outcomes
    if pitcher.throws == "R" && batter.batting_hand == "R"
      batter.vs_rhp.merge(pitcher.vs_rhb)   
    elsif pitcher.throws == "R" && (batter.batting_hand == "L" || batter.batting_hand == "S")
      batter.vs_rhp.merge(pitcher.vs_lhb)   
    elsif pitcher.throws == "L" && batter.batting_hand == "L"
      batter.vs_lhp.merge(pitcher.vs_lhb)   
    elsif pitcher.throws == "L" && (batter.batting_hand == "R" || batter.batting_hand == "S")
      batter.vs_lhp.merge(pitcher.vs_rhb)
    else
      raise "unreachable condition"
    end
  end
end
