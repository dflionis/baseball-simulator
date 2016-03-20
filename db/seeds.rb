leagues = []

{ "American League" => true, "National League" => false }.each do |name, dh|
  leagues << League.create(name: name, dh: dh)
end

regions = %w(East Central West)

leagues.each do |league|
  regions.each do |region|
    Division.create(
      league: league,
      region: region
    )
  end
end
