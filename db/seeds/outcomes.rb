puts "Creating all possible outcomes..."
outcomes = [
  "CATCH-X",
  "DO",
  "DO**",
  "DOUBLE (cf)",
  "DOUBLE (lf)",
  "DOUBLE (rf)",
  "FLY (cf) X",
  "FLY (lf) X",
  "FLY (rf) X",
  "GB (1b) X",
  "GB (2b) X",
  "GB (3b) X",
  "GB (p) X",
  "GB (ss) X",
  "HBP",
  "HBP plus injury",
  "HOMERUN",
  "HR",
  "N-HR",
  "SI",
  "SI*",
  "SI**",
  "SINGLE",
  "SINGLE*",
  "SINGLE**",
  "SINGLE (cf)",
  "SINGLE (lf)",
  "SINGLE (rf)",
  "TR",
  "TRIPLE",
  "WALK",
  "fly (cf) A",
  "fly (cf) A plus injury",
  "fly (cf) B",
  "fly (cf) B?",
  "fly (cf) C",
  "fly (lf) B",
  "fly (lf) B?",
  "fly (lf) C",
  "fly (rf) B",
  "fly (rf) B?",
  "fly (rf) C",
  "foulout (1b)",
  "foulout (3b)",
  "foulout (C)",
  "foulout (c)",
  "gb (1b) A",
  "gb (1b) A+",
  "gb (1b) B",
  "gb (1b) C",
  "gb (1b) C plus injury",
  "gb (1b) X",
  "gb (2b) A",
  "gb (2b) A plus injury",
  "gb (2b) A+ plus injury",
  "gb (2b) A+",
  "gb (2b) B",
  "gb (2b) B+",
  "gb (2b) C",
  "gb (2b) C plus injury",
  "gb (3b) A",
  "gb (3b) A plus injury",
  "gb (3b) B",
  "gb (p) A",
  "gb (p) B",
  "gb (ss) A",
  "gb (ss) A plus injury",
  "gb (ss) A+",
  "gb (ss) A+ plus injury",
  "gb (ss) B",
  "gb (ss) B+",
  "lineout (1b)",
  "lineout (2b)",
  "lineout (3b)",
  "lineout (ss)",
  "lo (1b)",
  "lo (1b) max",
  "lo (2b)",
  "lo (2b) max",
  "lo (2b) max plus injury",
  "lo (3b)",
  "lo (3b) max",
  "lo (3b) max plus injury",
  "lo (ss)",
  "lo (ss) max",
  "popout (1b)",
  "popout (2b)",
  "popout (3b)",
  "popout (ss)",
  "strikeout",
  "strikeout plus injury"
]

# TODO: Handle sacrifice at-bats that shouldn't count as ABs
outcomes.each do |outcome|
  if ["strikeout", "strikeout plus injury"].include?(outcome)
    Outcome.create!(code: outcome, so: true)
  elsif ["DO", "DO**", "DOUBLE (cf)", "DOUBLE (lf)", "DOUBLE (rf)"].include?(outcome)
    Outcome.create!(code: outcome, h: true, double: true)
  elsif ["TR", "TRIPLE"].include?(outcome)
    Outcome.create!(code: outcome, h: true, triple: true)
  elsif ["HOMERUN", "N-HR", "HR"].include?(outcome)
    Outcome.create!(code: outcome, h: true, hr: true)
  elsif ["WALK", "HBP", "HBP plus injury"].include?(outcome)
    Outcome.create!(code: outcome, ab: false, bb: true)
  elsif ["SI", "SI*", "SI**", "SINGLE", "SINGLE*", "SINGLE**", "SINGLE (cf)", "SINGLE (lf)", "SINGLE (rf)"].include?(outcome)
    Outcome.create!(code: outcome, h: true)
  else
    Outcome.create!(code: outcome)
  end
end
