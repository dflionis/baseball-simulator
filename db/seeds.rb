seed_files = %w(leagues_and_divisions teams positions players player_positions pitchers games default_lineup_slots outcomes)

puts "=========================="
puts "==== SEEDING DATABASE ===="
puts "=========================="
seed_files.each do |seed_file|
  load File.join(Rails.root, "db", "seeds", "#{seed_file}.rb")
end

puts "=========================="
