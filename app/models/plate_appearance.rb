class PlateAppearance < ApplicationRecord
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
    determine_outcome
    code = outcome.code
    code.slice!(" with injury") # Implement injuries later
    code.slice!(" plus injury") # Implement injuries later

    # TODO: Sort these by probability at some point
    if simple_out?(code)
      inning.add_one_out
    elsif simple_single_like_event?(code)
      inning.runners_advance_one_base
      inning.man_on_first = batter
    elsif home_run?(code)
      inning.everyone_scores_including_batter
    elsif single_with_two_asterisk?(code)
      inning.runners_advance_two_bases
      inning.man_on_first = batter
    elsif double?(code)
      inning.runners_advance_two_bases
      inning.man_on_second = batter
    elsif triple?(code)
      inning.everyone_scores_except_batter
      inning.man_on_third = batter
    elsif groundball_a?(code)
      if !inning.at_least_one_runner_forced? || inning.two_outs?
        inning.add_one_out
      else
        inning.add_two_outs 
        inning.man_on_first = nil
        inning.runners_advance_one_base unless inning.three_outs?
      end
    elsif groundball_b?(code)
      if !inning.at_least_one_runner_forced? || inning.two_outs?
        inning.add_one_out
      else
        inning.man_on_first = nil
        inning.add_one_out
        inning.man_on_first = batter
      end
    elsif groundball_c?(code)
      inning.add_one_out
      inning.runners_advance_one_base unless inning.three_outs?
    elsif groundball_x?(code)
      # NOT YET CODED...pretend its Flyball A
      if !inning.at_least_one_runner_forced? || inning.two_outs?
        inning.add_one_out
      else
        inning.add_two_outs 
        inning.man_on_first = nil
        inning.runners_advance_one_base unless inning.three_outs?
      end
    elsif flyball_a?(code)
      inning.add_one_out
      inning.runners_advance_one_base unless inning.three_outs?
    elsif flyball_b?(code)
      inning.add_one_out
      inning.runner_from_third_scores unless inning.three_outs?
    elsif flyball_c?(code)
      inning.add_one_out
    elsif flyball_x?(code)
      # NOT YET CODED...pretend its Flyball A
      inning.add_one_out
      inning.runners_advance_one_base unless inning.three_outs?
    else
      raise "Unrecognized Code: #{code}"
    end

    inning.save!
  end

  def determine_outcome
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

  def simple_out?(code)
    simple_outs = ["strikeout", /^popout/, /^lineout/, /^foulout/, /^lo/, /^CATCH/]
    simple_outs.each do |simple_out|
      if simple_out.class == Regexp
        return true if code =~ simple_out
      else
        return true if code == simple_out
      end
    end
    false
  end

  def home_run?(code)
    %w(HOMERUN HR N-HR).include?(code)
  end

  def single_with_two_asterisk?(code)
    code =~ /^SI/i && code =~ /\*{2}$/
  end

  def double?(code)
    code =~ /^DO/i
  end

  def triple?(code)
    code =~ /^TR/i
  end

  def simple_single_like_event?(code)
    (code =~ /^SI/i && code !~ /\*{2}$/) || code =~ /^HBP/ || code =~ /^WALK/
  end

  def groundball_a?(code)
    code.downcase.first(2) == "gb" && code =~ /A\+?$/
  end

  def groundball_b?(code)
    code.downcase.first(2) == "gb" && code =~ /B\+?$/
  end

  def groundball_c?(code)
    code.downcase.first(2) == "gb" && code =~ /C$/
  end

  def groundball_x?(code)
    code.downcase.first(2) == "gb" && code =~ /X\+?$/
  end

  def flyball_a?(code)
    code.downcase.first(3) == "fly" && code =~ /A.?$/
  end

  def flyball_b?(code)
    code.downcase.first(3) == "fly" && code =~ /B.?$/
  end

  def flyball_c?(code)
    code.downcase.first(3) == "fly" && code =~ /C.?$/
  end

  def flyball_x?(code)
    code.downcase.first(3) == "fly" && code =~ /X.?$/
  end
end
