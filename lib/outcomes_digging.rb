module OutcomesDigging
  def self.validate_red_and_white_dice_values(data, klass)
    high_level_keys = klass == Player ? %w(1 2 3) : %w(4 5 6)
    if data.keys == high_level_keys &&
      data[high_level_keys[0]].keys == ("2".."12").to_a &&
      data[high_level_keys[1]].keys == ("2".."12").to_a &&
      data[high_level_keys[2]].keys == ("2".."12").to_a
        true
    else
      false
    end
  end

  def self.validate_20_sided_die_ranges(data)
    data.values.each do |hash|
      hash.each do |_, outcome|
        if outcome.is_a?(Hash)
          coverage = []
          outcome.keys.each do |range|
            if range.include?("-")
              coverage << Range.new(*range.split("-")).to_a
            else
              coverage << range
            end
          end
          return false if coverage.flatten != ("1".."20").to_a
        end
      end
    end 
    true
  end
end
