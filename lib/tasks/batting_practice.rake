namespace :batting_practice do
  desc "Batting Practice"
  task :start => :environment do
    pitcher = Pitcher.find_by(last_name: "Porcello")
    batter = Player.find_by(last_name: "Betts")
    puts "#{batter.last_name} vs. #{pitcher.last_name}"
    puts "==================="
    outcomes = determine_outcomes(pitcher, batter)
    ab, h, hr, bb, so, doubles, triples = 0, 0, 0, 0, 0, 0, 0

    (1..50).each do |at_bat|
      outcome = determine_outcome(outcomes)

      if outcome == "HR"
        h += 1
        hr += 1
        ab += 1
      elsif outcome =~ /^DO\*?\*?/
        h += 1
        ab += 1
        doubles += 1
      elsif outcome == "TR"
        h += 1
        ab += 1
        triples += 1
      elsif outcome == "WALK"
        bb += 1
      elsif outcome =~ /^HBP/
        bb += 1
      elsif outcome == "strikeout"
        so += 1
        ab += 1
      elsif outcome =~ /^gb/i
        ab += 1
      elsif outcome =~ /^FLY/
        ab += 1
      elsif outcome =~ /^lineout/ || outcome =~ /^lo/
        ab += 1
      elsif outcome =~ /^popout/
        ab += 1
      elsif outcome =~ /^foulout/
        ab += 1
      elsif outcome =~ /^fly/
        ab += 1
      elsif outcome =~ /^CATCH/
        ab += 1
      elsif outcome =~ /SI\*\*?/ || outcome =~ /^SINGLE/
        ab += 1
         h += 1
      else
        puts "you need to code #{outcome}"
      end
    end

    puts "#{ab} at bats"
    puts "#{h} hits"
    puts "#{(h / ab.to_f).round(3)} batting average"
    puts "#{hr} home runs"
    puts "#{bb} walks"
    puts "#{so} strikeouts"
    puts "#{doubles} doubles"
    puts "#{triples} triples"
  end

  def determine_outcome(outcomes) # should ultimately just be called "outcome" per ruby conventions
    white_dice, red_dice = Dice.roll
    outcome = outcomes[white_dice][red_dice]

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

    outcome
  end

  def determine_outcomes(pitcher, batter) # should have a different name per ruby conventions
    if pitcher.throws == "R" && batter.batting_hand == "R"
      batter.vs_rhp.merge(pitcher.vs_rhb)   
    elsif pitcher.throws == "R" && (batter.batting_hand == "L" || batter.batting_hand == "B")
      batter.vs_rhp.merge(pitcher.vs_lhb)   
    elsif pitcher.throws == "L" && batter.batting_hand == "L"
      batter.vs_lhp.merge(pitcher.vs_lhb)   
    elsif pitcher.throws == "L" && (batter.batting_hand == "R" || batter.batting_hand == "B")
      batter.vs_lhp.merge(pitcher.vs_rhb)
    else
      raise "unreachable condition"
    end
  end
end
