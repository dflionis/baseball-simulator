seed_files = %w(leagues_and_divisions teams positions)

seed_files.each do |seed_file|
  load File.join(Rails.root, "db", "seeds", "#{seed_file}.rb")
end
