puts "Assigning Players to Positions..."

teams = %w(red_sox yankees)

teams.each do |team|
  load File.join(Rails.root, "db", "seeds", "player_positions", "#{team}.rb")
end

