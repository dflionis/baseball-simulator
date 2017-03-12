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
    determine_outcome
    code = outcome.code

    if code == "strikeout"
      inning.add_one_out
    elsif code.downcase.first(3) == "fly"
      #### FLYBALL A #######
      if code =~ /A$/
        if inning.two_outs
          inning.retire_the_side
        else
          inning.add_one_out
          inning.runners_advance_one_base
        end
      #### FLYBALL B #######
      elsif code =~ /B\.?$/
        if inning.two_outs
          inning.retire_the_side
        else
          inning.add_one_out
          inning.runner_from_third_scores
        end
      #### FLYBALL C #######
      else
        inning.add_one_out
      end
    elsif code.downcase.first(2) == "gb"
      # TODO: Add Groundball B...handle Groundball X in some way for now
      if code =~ /A\+?$/
        if inning.two_outs
          inning.retire_the_side
        elsif (0..1).include?(inning.outs)
          if inning.man_on_first
            inning.add_two_outs
            inning.clear_bases
          elsif inning.man_on_second && inning.man_on_third
            inning.add_one_out
            inning.runs += 1
            inning.man_on_third = inning.man_on_second # FIXME: I think the runners may hold?
            inning.man_on_second = nil
          elsif inning.man_on_third
            inning.add_one_out
            inning.runs += 1
            inning.man_on_third = nil
          elsif inning.man_on_second
            inning.add_one_out
            inning.man_on_third = inning.man_on_second
            inning.man_on_second = nil
          else # man on first
            inning.add_one_out
          end
        end
      elsif code =~ /C$/
        if inning.two_outs
          inning.retire_the_side
        else
          if inning.man_on_third
            inning.runs += 1
            inning.man_on_third = nil
              if inning.man_on_second
                inning.man_on_third = inning.man_on_second
                inning.man_on_second = nil
              end
              if inning.man_on_first
                inning.man_on_second = inning.man_on_first
                inning.man_on_first = nil
              end
            elsif inning.man_on_second
              inning.man_on_third = inning.man_on_second
              inning.man_on_second = nil
              if inning.man_on_first
                inning.man_on_second = inning.man_on_first
                inning.man_on_first = nil
              end
            elsif inning.man_on_first
              inning.man_on_second = inning.man_on_first
              inning.man_on_first = nil
            else
              # nothing happens
            end
            inning.add_one_out
          end
        else
          inning.add_one_out
        end
      elsif code =~ /^popout/
        inning.add_one_out
      elsif code =~ /^lineout/
        inning.add_one_out
      elsif code =~ /^foulout/
        inning.add_one_out
      elsif code =~ /^lo/
        inning.add_one_out
      elsif code =~ /^CATCH/
        inning.add_one_out
      elsif code == "HOMERUN" || code == "HR" || code == 'N-HR'
        inning.runs += ([inning.man_on_third, inning.man_on_second, inning.man_on_first].compact.size + 1)
        inning.clear_bases
      elsif code =~ /^SI/i && code =~ /\*{2}$/
        if inning.man_on_third
          inning.runs += 1
          inning.man_on_third = nil
          if inning.man_on_second
            inning.runs += 1
            inning.man_on_second = nil
          end
          if inning.man_on_third
            inning.man_on_third = inning.man_on_first
            inning.man_on_first = nil
          end
          inning.man_on_first = batter
        elsif inning.man_on_second
          inning.runs += 1
          inning.man_on_second = nil
          if inning.man_on_first
            inning.man_on_third = inning.man_on_first
            inning.man_on_first = nil
          end
          inning.man_on_first = batter
        elsif inning.man_on_first
          inning.man_on_third = inning.man_on_first
          inning.man_on_first = nil
          inning.man_on_first = batter
        else
          inning.man_on_first = batter
        end
      elsif code =~ /^SI/i || code =~ /^HBP/ || code =~ /^WALK/
        if inning.man_on_third
          inning.runs += 1
          inning.man_on_third = nil
          if inning.man_on_second
            inning.man_on_third = inning.man_on_second
            inning.man_on_second = nil
          end 
          if inning.man_on_first
            inning.man_on_second = inning.man_on_first
            inning.man_on_first = nil
          end
          inning.man_on_first = batter
        elsif inning.man_on_second
          inning.man_on_third = inning.man_on_second
          inning.man_on_second = nil
          if inning.man_on_first
            inning.man_on_second = inning.man_on_first
            inning.man_on_first = nil
          end
          inning.man_on_first = batter
        elsif inning.man_on_first
          inning.man_on_second = inning.man_on_first
          inning.man_on_first = nil
          inning.man_on_first = batter
        else
          inning.man_on_first = batter
        end
      elsif code =~ /^DO/i
        if inning.man_on_third
          inning.runs += 1
          inning.man_on_third = nil
          if inning.man_on_second
            inning.runs += 1
            inning.man_on_second = nil
          end
          if inning.man_on_first
            inning.man_on_third = inning.man_on_first
            inning.man_on_first = nil
          end
          inning.man_on_second = batter
        elsif inning.man_on_second
          inning.runs += 1
          inning.man_on_second = nil
          if inning.man_on_first
            inning.man_on_third = inning.man_on_first
            inning.man_on_first = nil
          end
          inning.man_on_second = batter
        elsif inning.man_on_first
          inning.man_on_third = inning.man_on_first
          inning.man_on_first = nil
          inning.man_on_second = batter
        else
          inning.man_on_second = batter
        end
      elsif code =~ /^TR/i
        inning.runs += [inning.man_on_third, inning.man_on_second, inning.man_on_first].compact.size
        inning.clear_bases
        inning.man_on_third = batter
      else
        raise "You need to code: #{code}"
      end
    #TODO: Spacing problem
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
end
