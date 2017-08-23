puts "Creating Players..."

teams = %w(red_sox yankees blue_jays orioles)

teams.each do |team|
  load File.join(Rails.root, "db", "seeds", "players", "#{team}.rb")
end
