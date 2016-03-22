leagues = []

puts "Creating Leagues..."
{ "American League" => true, "National League" => false }.each do |name, dh|
  leagues << League.create(name: name, dh: dh)
end

regions = %w(East Central West)

puts "Creating Divisions..."
leagues.each do |league|
  regions.each do |region|
    Division.create(
      league: league,
      region: region
    )
  end
end

puts "Creating Teams..."
league = League.find_by(name: "American League")
division = Division.find_by(league: league, region: Division.regions["East"])
Team.create(city: "Baltimore", name: "Orioles", division: division)
Team.create(city: "Boston", name: "Red Sox", division: division)
Team.create(city: "New York", name: "Yankees", division: division)
Team.create(city: "Tampa Bay", name: "Rays", division: division)
Team.create(city: "Toronto", name: "Blue Jays", division: division)

division = Division.find_by(league: league, region: Division.regions["Central"])
Team.create(city: "Chicago", name: "White Sox", division: division)
Team.create(city: "Cleveland", name: "Indians", division: division)
Team.create(city: "Detroit", name: "Tigers", division: division)
Team.create(city: "Kansas City", name: "Royals", division: division)
Team.create(city: "Minnesota", name: "Twins", division: division)

division = Division.find_by(league: league, region: Division.regions["West"])
Team.create(city: "Houston", name: "Astros", division: division)
Team.create(city: "Los Angeles", name: "Angels", division: division)
Team.create(city: "Oakland", name: "Athletics", division: division)
Team.create(city: "Seattle", name: "Mariners", division: division)
Team.create(city: "Texas", name: "Rangers", division: division)

league = League.find_by(name: "National League")
division = Division.find_by(league: league, region: Division.regions["East"])
Team.create(city: "Atlanta", name: "Braves", division: division)
Team.create(city: "Miami", name: "Marlins", division: division)
Team.create(city: "New York", name: "Mets", division: division)
Team.create(city: "Philadelphia", name: "Phillies", division: division)
Team.create(city: "Washington", name: "Nationals", division: division)

division = Division.find_by(league: league, region: Division.regions["Central"])
Team.create(city: "Chicago", name: "Cubs", division: division)
Team.create(city: "Cincinnati", name: "Reds", division: division)
Team.create(city: "Milwaukee", name: "Brewers", division: division)
Team.create(city: "Pittsburgh", name: "Pirates", division: division)
Team.create(city: "St. Louis", name: "Cardinals", division: division)

division = Division.find_by(league: league, region: Division.regions["West"])
Team.create(city: "Arizona", name: "Diamondbacks", division: division)
Team.create(city: "Colorado", name: "Rockies", division: division)
Team.create(city: "Los Angeles", name: "Dodgers", division: division)
Team.create(city: "San Diego", name: "Padres", division: division)
Team.create(city: "San Francisco", name: "Giants", division: division)
