puts "Assigning Players to Positions..."

teams = %w(red_sox yankees orioles blue_jays)

teams.each do |team|
  load File.join(Rails.root, "db", "seeds", "player_positions", "#{team}.rb")
end

