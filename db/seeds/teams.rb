puts "Creating Teams..."
league = League.find_by(name: "American League")
division = Division.find_by(league: league, region: "East")
Team.create(city: "Baltimore", name: "Orioles", division: division, logo: "orioles.png")
Team.create(city: "Boston", name: "Red Sox", division: division, logo: "red_sox.png")
Team.create(city: "New York", name: "Yankees", division: division, logo: "yankees.png")
Team.create(city: "Tampa Bay", name: "Rays", division: division, logo: "rays.png")
Team.create(city: "Toronto", name: "Blue Jays", division: division, logo: "blue_jays.png")

division = Division.find_by(league: league, region: "Central")
Team.create(city: "Chicago", name: "White Sox", division: division, logo: "white_sox.png")
Team.create(city: "Cleveland", name: "Indians", division: division, logo: "indians.png")
Team.create(city: "Detroit", name: "Tigers", division: division, logo: "tigers.png")
Team.create(city: "Kansas City", name: "Royals", division: division, logo: "royals.png")
Team.create(city: "Minnesota", name: "Twins", division: division, logo: "twins.png")

division = Division.find_by(league: league, region: "West")
Team.create(city: "Houston", name: "Astros", division: division, logo: "astros.png")
Team.create(city: "Los Angeles", name: "Angels", division: division, logo: "angels.png")
Team.create(city: "Oakland", name: "Athletics", division: division, logo: "athletics.png")
Team.create(city: "Seattle", name: "Mariners", division: division, logo: "mariners.png")
Team.create(city: "Texas", name: "Rangers", division: division, logo: "rangers.png")

league = League.find_by(name: "National League")
division = Division.find_by(league: league, region: "East")
Team.create(city: "Atlanta", name: "Braves", division: division, logo: "braves.png")
Team.create(city: "Miami", name: "Marlins", division: division, logo: "marlins.png")
Team.create(city: "New York", name: "Mets", division: division, logo: "mets.png")
Team.create(city: "Philadelphia", name: "Phillies", division: division, logo: "phillies.gif")
Team.create(city: "Washington", name: "Nationals", division: division, logo: "nationals.png")

division = Division.find_by(league: league, region: "Central")
Team.create(city: "Chicago", name: "Cubs", division: division, logo: "cubs.png")
Team.create(city: "Cincinnati", name: "Reds", division: division, logo: "reds.gif")
Team.create(city: "Milwaukee", name: "Brewers", division: division, logo: "brewers.png")
Team.create(city: "Pittsburgh", name: "Pirates", division: division, logo: "pirates.png")
Team.create(city: "St. Louis", name: "Cardinals", division: division, logo: "cardinals.gif")

division = Division.find_by(league: league, region: "West")
Team.create(city: "Arizona", name: "Diamondbacks", division: division, logo: "diamondbacks.png")
Team.create(city: "Colorado", name: "Rockies", division: division, logo: "rockies.png")
Team.create(city: "Los Angeles", name: "Dodgers", division: division, logo: "dodgers.png")
Team.create(city: "San Diego", name: "Padres", division: division, logo: "padres.png")
Team.create(city: "San Francisco", name: "Giants", division: division, logo: "giants.png")