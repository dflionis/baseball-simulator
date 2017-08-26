puts "Creating Blue Jays players..."
blue_jays = Team.find_by(name: "Blue Jays")

=begin
LF Ben Revere
3B Josh Donaldson
RF Jose Bautista
DH Edwin Encarnacion
SS Troy Tulowitzki
1B Justin Smoak
C Russell Martin
CF Kevin Pillar
2B Ryan Goins

SP R.A. Dickey
=end

Player.create!(
  team: blue_jays,
  first_name: "Russell",
  last_name: "Martin",
  batting_hand: "R",
  stealing: "D",
  running: "1-12",
  avg: 0.240,
  ab: 441,
  doubles: 23,
  triples: 2,
  hr: 23,
  rbi: 77,
  bb: 53,
  so: 106,
  sb: 4,
  cs: 5,
  slg: 0.458,
  obp: 0.329,
  vs_lhp: {
    "1" => {
      "2" => "WALK",
      "3" => "HBP plus injury",
      "4" => "WALK",
      "5" => "fly (lf) B?",
      "6" => "strikeout",
      "7" => "WALK",
      "8" => "WALK",
      "9" => "strikeout",
      "10" => "gb (2b) C",
      "11" => "WALK",
      "12" => "WALK"
    },
    "2" => {
      "2" => {
        "1-15" => "SI*",
        "16-20" => "lo (ss)"
      },
      "3" => "SINGLE (lf)",
      "4" => "gb (2b) C",
      "5" => "DOUBLE (lf)",
      "6" => "gb (ss) A",
      "7" => "WALK",
      "8" => {
        "1-14" => "DO**",
        "15-20" => "SI**"
      },
      "9" => {
        "1-17" => "HR",
        "18-20" => "DO"
      },
      "10" => {
        "1-19" => "HR",
        "20" => "fly (lf) B"
      },
      "11" => "fly (lf) B?",
      "12" => "fly (rf) B?"
    },
    "3" => {
      "2" => "fly (cf) A",
      "3" => "gb (ss) A+",
      "4" => "gb (3b) A",
      "5" => {
        "1-12" => "SI*",
        "13-20" => "gb (1b) B"
      },
      "6" => "gb (p) A",
      "7" => "WALK",
      "8" => "fly (cf) B?",
      "9" => "gb (ss) A+",
      "10" => "gb (3b) A",
      "11" => "HBP",
      "12" => "lo (2b) max"
    }
  },
  vs_rhp: {
    "1" => {
      "2" => "lo (2b) max",
      "3" => "HBP",
      "4" => "WALK",
      "5" => "strikeout",
      "6" => "gb (1b) C",
      "7" => "strikeout",
      "8" => "strikeout",
      "9" => "strikeout",
      "10" => "strikeout",
      "11" => "HBP plus injury",
      "12" => {
        "1-10" => "SI*",
        "11-20" => "lo (ss)"
      }
    },
    "2" => {
      "2" => "WALK",
      "3" => "SINGLE (lf)",
      "4" => "gb (3b) A",
      "5" => {
        "1-2" => "TR",
        "3-20" => "DO"
      },
      "6" => "gb (p) A",
      "7" => "WALK",
      "8" => {
        "1" => "DO",
        "2-20" => "fly (lf) B"
      },
      "9" => {
        "1-19" => "HR",
        "20" => "TR"
      },
      "10" => {
        "1-19" => "HR",
        "20" => "fly (lf) B"
      },
      "11" => "fly (lf) B?",
      "12" => "gb (ss) A"
    },
    "3" => {
      "2" => "gb (2b) C",
      "3" => "gb (3b) A",
      "4" => "gb (ss) A",
      "5" => "SINGLE**",
      "6" => "gb (3b) A",
      "7" => {
        "1-2" => "SI*",
        "3-20" => "gb (2b) B"
      },
      "8" => "gb (ss) A+",
      "9" => "strikeout",
      "10" => "gb (ss) A",
      "11" => "fly (lf) B?",
      "12" => "fly (cf) A"
    }
  }
)

Player.create!(
  team: blue_jays,
  first_name: "Kevin",
  last_name: "Pillar",
  batting_hand: "R",
  stealing: "A",
  running: "1-15",
  avg: 0.278,
  ab: 586,
  doubles: 31,
  triples: 2,
  hr: 12,
  rbi: 56,
  bb: 28,
  so: 85,
  sb: 25,
  cs: 4,
  slg: 0.399,
  obp: 0.314,
  vs_lhp: {
    "1" => {
      "2" => "lo (2b) max",
      "3" => {
        "1-10" => "SI*",
        "11-20" => "lo (ss)"
      },
      "4" => "popout (ss)",
      "5" => "fly (lf) B?",
      "6" => "lineout (3b)",
      "7" => "gb (ss) A+",
      "8" => "fly (cf) B?",
      "9" => "gb (2b) C",
      "10" => "popout (ss)",
      "11" => "foulout (3b)",
      "12" => "HBP plus injury"
    },
    "2" => {
      "2" => "HBP",
      "3" => "SINGLE (cf)",
      "4" => "fly (lf) B?",
      "5" => "SINGLE**",
      "6" => "SINGLE**",
      "7" => "gb (ss) A",
      "8" => {
        "1-12" => "HR",
        "13-20" => "DO"
      },
      "9" => {
        "1-6" => "DO**",
        "7-20" => "SI**"
      },
      "10" => "SINGLE (rf)",
      "11" => "SINGLE (rf)",
      "12" => "SINGLE (cf)"
    },
    "3" => {
      "2" => "WALK",
      "3" => "gb (3b) A",
      "4" => "fly (rf) B?",
      "5" => "strikeout",
      "6" => "strikeout",
      "7" => "popout (ss)",
      "8" => {
        "1-14" => "SI*",
        "15-20" => "lo (3b)"
      },
      "9" => "strikeout",
      "10" => "gb (p) A",
      "11" => "gb (1b) C",
      "12" => "strikeout"
    }
  },
  vs_rhp: {
    "1" => {
      "2" => "HBP plus injury",
      "3" => "foulout (3b)",
      "4" => "popout (ss)",
      "5" => "gb (2b) C",
      "6" => "popout (ss)",
      "7" => "fly (lf) B?",
      "8" => "strikeout",
      "9" => "popout (ss)",
      "10" => "popout (3b)",
      "11" => {
        "1-10" => "SI*",
        "11-20" => "lo (ss)"
      },
      "12" => "HBP"
    },
    "2" => {
      "2" => "lineout (1b)",
      "3" => "WALK",
      "4" => "fly (rf) B?",
      "5" => "gb (p) A",
      "6" => "SINGLE (cf)",
      "7" => "fly (lf) B?",
      "8" => {
        "1-3" => "HR",
        "4-20" => "DO"
      },
      "9" => {
        "1-2" => "TR",
        "3-20" => "SI**"
      },
      "10" => {
        "1-15" => "DO**",
        "16-20" => "SI**"
      },
      "11" => "SINGLE (lf)",
      "12" => {
        "1-11" => "HR",
        "12-20" => "fly (lf) B"
      }
    },
    "3" => {
      "2" => "SINGLE (rf)",
      "3" => "gb (1b) C",
      "4" => "gb (3b) A",
      "5" => "SINGLE**",
      "6" => {
        "1-3" => "SI*",
        "4-20" => "lo (3b)"
      },
      "7" => "gb (ss) A+",
      "8" => "SINGLE**",
      "9" => "gb (ss) A",
      "10" => "gb (3b) B",
      "11" => "foulout (c)",
      "12" => "lo (2b) max"
    }
  }
)

Player.create!(
  team: blue_jays,
  first_name: "Jose",
  last_name: "Bautista",
  batting_hand: "R",
  stealing: "C",
  running: "1-13",
  avg: 0.250,
  ab: 543,
  doubles: 29,
  triples: 3,
  hr: 40,
  rbi: 114,
  bb: 110,
  so: 106,
  sb: 8,
  cs: 2,
  slg: 0.536,
  obp: 0.377,
  vs_lhp: {
    "1" => {
      "2" => "lo (3b) max",
      "3" => "gb (ss) A",
      "4" => "gb (p) A",
      "5" => "WALK",
      "6" => "WALK",
      "7" => "strikeout",
      "8" => "WALK",
      "9" => "strikeout",
      "10" => "WALK",
      "11" => "WALK",
      "12" => "WALK"
    },
    "2" => {
      "2" => "fly (lf) B?",
      "3" => "WALK",
      "4" => "foulout (c)",
      "5" => "WALK",
      "6" => {
        "1-10" => "HR",
        "11-20" => "DO"
      },
      "7" => {
        "1-4" => "TR",
        "5-20" => "fly (cf) B"
      },
      "8" => "popout (2b)",
      "9" => {
        "1-11" => "DO**",
        "12-20" => "SI**"
      },
      "10" => {
        "1-15" => "HR",
        "16-20" => "fly (lf) B"
      },
      "11" => "WALK",
      "12" => "gb (ss) A+"
    },
    "3" => {
      "2" => "HBP",
      "3" => "gb (1b) C",
      "4" => "fly (rf) B?",
      "5" => "gb (2b) C",
      "6" => "WALK",
      "7" => {
        "1-2" => "SI*",
        "3-20" => "lo (ss)"
      },
      "8" => "gb (ss) A+",
      "9" => "fly (cf) B?",
      "10" => "gb (3b) A",
      "11" => "gb (2b) A",
      "12" => "HBP plus injury"
    }
  },
  vs_rhp: {
    "1" => {
      "2" => "SINGLE (rf)",
      "3" => "HBP",
      "4" => "WALK",
      "5" => "WALK",
      "6" => "WALK",
      "7" => "gb (ss) A+",
      "8" => "WALK",
      "9" => "strikeout",
      "10" => "WALK",
      "11" => "WALK",
      "12" => "fly (lf) B?"
    },
    "2" => {
      "2" => {
        "1-11" => "HR",
        "12-20" => "fly (lf) B"
      },
      "3" => "SINGLE (lf)",
      "4" => "gb (3b) A",
      "5" => {
        "1-13" => "DO",
        "14-20" => "fly (cf) B"
      },
      "6" => "HOMERUN",
      "7" => {
        "1" => "TR",
        "2-20" => "fly (cf) B"
      },
      "8" => "popout (1b)",
      "9" => "HOMERUN",
      "10" => {
        "1-9" => "HR",
        "10-20" => "DO"
      },
      "11" => "fly (lf) B?",
      "12" => "fly (cf) A"
    },
    "3" => {
      "2" => "gb (1b) C",
      "3" => "gb (p) A",
      "4" => "gb (ss) A",
      "5" => "strikeout",
      "6" => "WALK",
      "7" => {
        "1-4" => "SI*",
        "5-20" => "lo (ss)"
      },
      "8" => "gb (2b) C",
      "9" => "strikeout",
      "10" => "fly (rf) B?",
      "11" => "gb (p) A",
      "12" => "lo (3b) max plus injury"
    }
  }
)

Player.create!(
  team: blue_jays,
  first_name: "Edwin",
  last_name: "Encarnacion",
  batting_hand: "R",
  stealing: "D",
  running: "1-11",
  avg: 0.277,
  ab: 528,
  doubles: 31,
  triples: 0,
  hr: 39,
  rbi: 111,
  bb: 77,
  so: 98,
  sb: 3,
  cs: 2,
  slg: 0.557,
  obp: 0.372,
  vs_lhp: {
    "1" => {
      "2" => "lo (3b) max",
      "3" => "HBP",
      "4" => "fly (cf) B?",
      "5" => "WALK",
      "6" => "WALK",
      "7" => "gb (2b) C",
      "8" => "WALK",
      "9" => "strikeout",
      "10" => "fly (rf) B?",
      "11" => {
        "1-13" => "SI*",
        "14-20" => "lo (ss)"
      },
      "12" => "HBP plus injury"
    },
    "2" => {
      "2" => "fly (cf) A",
      "3" => "fly (cf) B?",
      "4" => "gb (p) A",
      "5" => "strikeout",
      "6" => "strikeout",
      "7" => "strikeout",
      "8" => "WALK",
      "9" => "strikeout",
      "10" => "gb (ss) A",
      "11" => "gb (3b) A",
      "12" => "gb (p) A"
    },
    "3" => {
      "2" => "gb (3b) A",
      "3" => "SINGLE (lf)",
      "4" => "SINGLE (lf)",
      "5" => {
        "1-7" => "SI*",
        "8-20" => "lo (3b)"
      },
      "6" => "SINGLE (rf)",
      "7" => "gb (ss) A+",
      "8" => {
        "1-17" => "HR",
        "18-20" => "DO"
      },
      "9" => {
        "1-17" => "HR",
        "18-20" => "fly (lf) B"
      },
      "10" => {
        "1-9" => "DO",
        "10-20" => "fly (lf) B"
      },
      "11" => "fly (lf) B?",
      "12" => "strikeout"
    }
  },
  vs_rhp: {
    "1" => {
      "2" => "SINGLE (lf)",
      "3" => "SINGLE (cf)",
      "4" => "fly (lf) B?",
      "5" => "WALK",
      "6" => "WALK",
      "7" => "gb (ss) A+",
      "8" => {
        "1-2" => "SI*",
        "3-20" => "lo (3b)"
      },
      "9" => "strikeout",
      "10" => "fly (rf) B?",
      "11" => "HBP",
      "12" => "lo (3b) max"
    },
    "2" => {
      "2" => "HBP plus injury",
      "3" => "gb (1b) C",
      "4" => "gb (p) A",
      "5" => "gb (2b) C",
      "6" => "gb (3b) A",
      "7" => "WALK",
      "8" => "strikeout",
      "9" => "popout (ss)",
      "10" => "gb (ss) A",
      "11" => "foulout (c)",
      "12" => {
        "1-18" => "SI*",
        "19-20" => "lo (ss)"
      }
    },
    "3" => {
      "2" => "foulout (3b)",
      "3" => "fly (lf) B?",
      "4" => "WALK",
      "5" => "SINGLE (cf)",
      "6" => {
        "1-16" => "DO**",
        "17-20" => "SI**"
      },
      "7" => "fly (cf) B?",
      "8" => "HOMERUN",
      "9" => {
        "1-7" => "HR",
        "8-20" => "DO"
      },
      "10" => "HOMERUN",
      "11" => {
        "1-16" => "HR",
        "17-20" => "fly (lf) B"
      },
      "12" => "fly (lf) B?"
    }
  }
)

Player.create!(
  team: blue_jays,
  first_name: "Ryan",
  last_name: "Goins",
  batting_hand: "L",
  stealing: "E",
  running: "1-14",
  avg: 0.250,
  ab: 376,
  doubles: 16,
  triples: 4,
  hr: 5,
  rbi: 45,
  bb: 39,
  so: 83,
  sb: 2,
  cs: 1,
  slg: 0.354,
  obp: 0.318,
  vs_lhp: {
    "1" => {
      "2" => "gb (2b) A+",
      "3" => {
        "1-3" => "SI*",
        "4-20" => "lo (2b)"
      },
      "4" => "gb (2b) C",
      "5" => "strikeout",
      "6" => "strikeout",
      "7" => "WALK",
      "8" => "gb (p) A",
      "9" => "strikeout",
      "10" => "gb (ss) A",
      "11" => "gb (1b) C",
      "12" => "gb (2b) C"
    },
    "2" => {
      "2" => "HBP plus injury",
      "3" => "gb (1b) A",
      "4" => "fly (lf) B?",
      "5" => "strikeout",
      "6" => "strikeout",
      "7" => "fly (cf) B?",
      "8" => "gb (2b) A+",
      "9" => "strikeout",
      "10" => "strikeout",
      "11" => "gb (p) A",
      "12" => "lo (1b) max"
    },
    "3" => {
      "2" => "WALK",
      "3" => "WALK",
      "4" => "gb (1b) B",
      "5" => {
        "1-9" => "SI*",
        "10-20" => "gb (3b) B"
      },
      "6" => {
        "1" => "HR",
        "2-20" => "fly (lf) B"
      },
      "7" => {
        "1-4" => "TR",
        "5-20" => "SI**"
      },
      "8" => "gb (ss) A",
      "9" => "SINGLE (lf)",
      "10" => "TRIPLE",
      "11" => "SINGLE (lf)",
      "12" => "gb (2b) A"
    }
  },
  vs_rhp: {
    "1" => {
      "2" => "gb (p) B",
      "3" => "gb (1b) C",
      "4" => "gb (1b) B",
      "5" => "gb (p) A",
      "6" => "WALK",
      "7" => "WALK",
      "8" => "gb (2b) A+",
      "9" => "fly (lf) B?",
      "10" => "gb (2b) C",
      "11" => "gb (p) A",
      "12" => {
        "1-6" => "SI*",
        "7-20" => "lo (2b)"
      }
    },
    "2" => {
      "2" => "gb (2b) A+", 
      "3" => "gb (2b) A", 
      "4" => "gb (ss) A", 
      "5" => "strikeout",
      "6" => "strikeout",
      "7" => "fly (cf) B?",
      "8" => "strikeout",
      "9" => "strikeout",
      "10" => "fly (lf) B?",
      "11" => "fly (rf) B?",
      "12" => "HBP plus injury"
    },
    "3" => {
      "2" => "lo (1b) max",
      "3" => "WALK",
      "4" => "gb (3b) B",
      "5" => "SINGLE (lf)",
      "6" => {
        "1-11" => "HR",
        "12-20" => "DO"
      },
      "7" => {
        "1-4" => "DO**",
        "5-20" => "SI**"
      },
      "8" => "gb (ss) A",
      "9" => "SINGLE (lf)",
      "10" => {
        "1-4" => "TR",
        "5-20" => "SI**"
      },
      "11" => "SINGLE (lf)",
      "12" => "gb (1b) B"
    }
  }
)

Player.create!(
  team: blue_jays,
  first_name: "Josh",
  last_name: "Donaldson",
  batting_hand: "R",
  stealing: "D",
  running: "1-13",
  avg: 0.297,
  ab: 620,
  doubles: 41,
  triples: 2,
  hr: 41,
  rbi: 123,
  bb: 73,
  so: 133,
  sb: 6,
  cs: 0,
  slg: 0.568,
  obp: 0.371,
  vs_lhp: {
    "1" => {
      "2" => "fly (cf) A",
      "3" => "fly (lf) B?",
      "4" => "WALK",
      "5" => "DOUBLE (cf)",
      "6" => "DOUBLE (lf)",
      "7" => "fly (cf) B?",
      "8" => "HOMERUN",
      "9" => {
        "1-6" => "HR",
        "7-20" => "DO"
      },
      "10" => "HOMERUN",
      "11" => {
        "1-16" => "HR",
        "17-20" => "fly (lf) B"
      },
      "12" => "fly (lf) B?"
    },
    "2" => {
      "2" => "WALK",
      "3" => "SINGLE*",
      "4" => "fly (rf) B?",
      "5" => {
        "1-9" => "SI*",
        "10-20" => "lo (3b)"
      },
      "6" => "WALK",
      "7" => "gb (ss) A+",
      "8" => {
        "1-7" => "DO",
        "8-20" => "fly (lf) B",
      },
      "9" => "strikeout",
      "10" => "gb (3b) A",
      "11" => "strikeout",
      "12" => "lo (ss) max"
    },
    "3" => {
      "2" => "HBP plus injury",
      "3" => "gb (ss) A",
      "4" => "gb (2b) C",
      "5" => "strikeout",
      "6" => "strikeout",
      "7" => "WALK",
      "8" => "WALK",
      "9" => "gb (p) A",
      "10" => "gb (2b) C",
      "11" => {
        "1" => "SI*",
        "2-20" => "lo (ss)",
      },
      "12" => "HBP"
    }
  },
  vs_rhp: {
    "1" => {
      "2" => "fly (cf) A",
      "3" => "WALK",
      "4" => "fly (cf) B?",
      "5" => {
        "1-6" => "DO**",
        "7-20" => "SI**"
      },
      "6" => {
        "1" => "TR",
        "2-20" => "DO"
      },
      "7" => "strikeout",
      "8" => "HOMERUN",
      "9" => "HOMERUN",
      "10" => "fly (lf) B?",
      "11" => "SINGLE (lf)",
      "12" => {
        "1-8" => "SI*",
        "9-20" => "lo (ss)"
      }
    },
    "2" => {
      "2" => "WALK",
      "3" => "fly (cf) B?",
      "4" => "gb (p) A",
      "5" => "SINGLE**",
      "6" => {
        "1-2" => "SI*",
        "3-20" => "gb (1b) B"
      },
      "7" => "gb (1b) C",
      "8" => "SINGLE (lf)",
      "9" => "strikeout",
      "10" => "gb (ss) A",
      "11" => "fly (rf) B?",
      "12" => "lo (ss) max"
    },
    "3" => {
      "2" => "HBP plus injury",
      "3" => "gb (ss) A+",
      "4" => "gb (3b) A",
      "5" => "strikeout",
      "6" => "strikeout",
      "7" => "WALK",
      "8" => "WALK",
      "9" => "gb (ss) A+",
      "10" => "fly (rf) B?",
      "11" => "gb (p) A",
      "12" => "HBP"
    }
  }
)

Player.create!(
  team: blue_jays,
  first_name: "Justin",
  last_name: "Smoak",
  batting_hand: "S",
  stealing: "E",
  running: "1-9",
  avg: 0.226,
  ab: 296,
  doubles: 16,
  triples: 1,
  hr: 18,
  rbi: 59,
  bb: 29,
  so: 86,
  sb: 0,
  cs: 0,
  slg: 0.470,
  obp: 0.299,
  vs_lhp: {
    "1" => {
      "2" => "HOMERUN",
      "3" => "fly (lf) B?",
      "4" => "HOMERUN",
      "5" => {
        "1-19" => "HR",
        "20" => "fly (lf) B"
      },
      "6" => {
        "1-18" => "HR",
        "19-20" => "fly (lf) B"
      },
      "7" => "SINGLE (lf)",
      "8" => {
        "1-6" => "SI*",
        "7-20" => "gb (2b) B"
      },
      "9" => "gb (ss) A",
      "10" => "gb (1b) B",
      "11" => "SINGLE (cf)",
      "12" => "fly (lf) B?"
    },
    "2" => {
      "2" => {
        "1-10" => "SI*",
        "11-20" => "lo (ss)"
      },
      "3" => "HBP",
      "4" => "strikeout",
      "5" => "strikeout",
      "6" => "strikeout",
      "7" => "fly (cf) B?",
      "8" => "gb (2b) A",
      "9" => "strikeout",
      "10" => "gb (ss) A",
      "11" => "gb (3b) A",
      "12" => "lo (3b) max plus injury"
    },
    "3" => {
      "2" => "gb (1b) C",
      "3" => "gb (p) A",
      "4" => "gb (2b) C",
      "5" => "strikeout",
      "6" => "gb (3b) A",
      "7" => "gb (ss) A+",
      "8" => "popout (ss)",
      "9" => "fly (rf) B",
      "10" => "gb (p) B",
      "11" => "gb (1b) C",
      "12" => "fly (cf) A"
    }
  },
  vs_rhp: {
    "1" => {
      "2" => "HOMERUN",
      "3" => {
        "1" => "HR",
        "2-20" => "DO"
      },
      "4" => "HOMERUN",
      "5" => "HOMERUN",
      "6" => {
        "1-6" => "DO",
        "7-20" => "fly (lf) B"
      },
      "7" => {
        "1-7" => "SI*",
        "8-20" => "gb (2b) B"
      },
      "8" => "WALK",
      "9" => "strikeout",
      "10" => "gb (ss) A",
      "11" => "fly (lf) B?",
      "12" => {
        "1" => "HR",
        "2-20" => "fly (lf) B"
      }
    },
    "2" => {
      "2" => "WALK",
      "3" => "gb (p) A",
      "4" => {
        "1" => "TR",
        "2-20" => "DO"
      },
      "5" => "strikeout",
      "6" => "strikeout",
      "7" => "gb (1b) C",
      "8" => "strikeout",
      "9" => "strikeout",
      "10" => "WALK",
      "11" => "gb (p) A",
      "12" => "lo (2b) max plus injury"
    },
    "3" => {
      "2" => "fly (cf) A",
      "3" => "HBP",
      "4" => "gb (p) A",
      "5" => "WALK",
      "6" => "strikeout",
      "7" => "gb (2b) A",
      "8" => "strikeout",
      "9" => "strikeout",
      "10" => "gb (ss) A",
      "11" => "gb (1b) A",
      "12" => "gb (p) A"
    }
  }
)

Player.create!(
  team: blue_jays,
  first_name: "Ben",
  last_name: "Revere",
  batting_hand: "L",
  stealing: "B",
  running: "1-17",
  avg: 0.319,
  ab: 226,
  doubles: 9,
  triples: 1,
  hr: 1,
  rbi: 19,
  bb: 13,
  so: 28,
  sb: 7,
  cs: 2,
  slg: 0.381,
  obp: 0.354,
  vs_lhp: {
    "1" => {
      "2" => "gb (2b) C",
      "3" => "gb (p) B",
      "4" => "gb (ss) B",
      "5" => {
        "1-6" => "SI*",
        "7-20" => "lo (2b)"
      },
      "6" => "SINGLE**",
      "7" => "WALK",
      "8" => "SINGLE**",
      "9" => "WALK",
      "10" => "gb (ss) B", 
      "11" => "gb (1b) B", 
      "12" => {
        "1-8" => "SI*",
        "9-20" => "lo (2b)"
      }
    },
    "2" => {
      "2" => "gb (3b) B",
      "3" => "fly (cf) B?",
      "4" => {
        "1-10" => "DO**",
        "11-20" => "SI**"
      },
      "5" => "SINGLE (cf)",
      "6" => "SINGLE (lf)",
      "7" => "SINGLE**",
      "8" => "SINGLE**",
      "9" => "fly (cf) B?",
      "10" => "SINGLE**",
      "11" => "SINGLE (rf)",
      "12" => "WALK"
    },
    "3" => {
      "2" => "lo (2b) max",
      "3" => "gb (2b) B+",
      "4" => "gb (2b) C",
      "5" => "fly (rf) B?",
      "6" => "strikeout",
      "7" => "strikeout",
      "8" => "fly (lf) B?",
      "9" => "gb (2b) B+",
      "10" => "gb (p) B",
      "11" => "gb (1b) C",
      "12" => "HBP plus injury"
    }
  },
  vs_rhp: {
    "1" => {
      "2" => {
        "1-8" => "SI*",
        "9-20" => "lo (2b)",
      },
      "3" => "foulout (c)",
      "4" => "gb (ss) B",
      "5" => {
        "1-2" => "SI*",
        "3-20" => "lo (2b)"
      },
      "6" => "SINGLE**",
      "7" => "fly (cf) B?",
      "8" => "SINGLE**",
      "9" => "fly (lf) B?",
      "10" => "gb (ss) B",
      "11" => "foulout (3b)",
      "12" => "popout (1b)"
    },
    "2" => {
      "2" => "popout (1b)",
      "3" => "fly (rf) B?",
      "4" => {
        "1-8" => "HR",
        "9-20" => "DO"
      },
      "5" => {
        "1-3" => "TR",
        "4-20" => "SI**",
      },
      "6" => {
        "1-4" => "DO**",
        "5-20" => "SI**"
      },
      "7" => "SINGLE (lf)",
      "8" => "SINGLE**",
      "9" => "gb (2b) C",
      "10" => "SINGLE (lf)",
      "11" => "SINGLE (lf)",
      "12" => "lo (2b) max"
    },
    "3" => {
      "2" => "HBP plus injury",
      "3" => "gb (1b) C",
      "4" => "fly (lf) B?",
      "5" => "gb (1b) B",
      "6" => "gb (p) B",
      "7" => "gb (2b) B+",
      "8" => "gb (2b) B",
      "9" => "gb (1b) B",
      "10" => "gb (1b) B",
      "11" => "gb (3b) B",
      "12" => "gb (1b) B"
    }
  }
)

Player.create!(
  team: blue_jays,
  first_name: "Troy",
  last_name: "Tulowitzki",
  batting_hand: "R",
  stealing: "E",
  running: "1-11",
  avg: 0.239,
  ab: 163,
  doubles: 8,
  triples: 0,
  hr: 5,
  rbi: 17,
  bb: 14,
  so: 42,
  sb: 1,
  cs: 0,
  slg: 0.380,
  obp: 0.317,
  vs_lhp: {
    "1" => {
      "2" => "HBP",
      "3" => {
        "1-14" => "SI*",
        "15-20" => "lo (ss)"
      },
      "4" => "gb (ss) A",
      "5" => {
        "1-12" => "SI*",
        "13-20" => "gb (3b) B"
      },
      "6" => "gb (ss) A+",
      "7" => "WALK",
      "8" => "fly (cf) B?",
      "9" => "strikeout",
      "10" => "HBP",
      "11" => "gb (p) A",
      "12" => "lo (3b) max"
    },
    "2" => {
      "2" => "WALK",
      "3" => "HBP plus injury",
      "4" => "WALK",
      "5" => "strikeout",
      "6" => "strikeout",
      "7" => "gb (2b) C",
      "8" => "strikeout",
      "9" => "strikeout",
      "10" => "strikeout",
      "11" => "WALK",
      "12" => "SINGLE (cf)"
    },
    "3" => {
      "2" => "fly (lf) B?",
      "3" => "SINGLE (lf)",
      "4" => "gb (ss) A",
      "5" => {
        "1-8" => "DO**",
        "9-20" => "SI**"
      },
      "6" => "gb (3b) A",
      "7" => "SINGLE**",
      "8" => "SINGLE (lf)",
      "9" => {
        "1-9" => "HR",
        "10-20" => "fly (lf) B"
      },
      "10" => "SINGLE (lf)",
      "11" => {
        "1-17" => "HR",
        "18-20" => "fly (lf) B"
      },
      "12" => "gb (ss) A+"
    }
  },
  vs_rhp: {
    "1" => {
      "2" => "gb (2b) A+",
      "3" => "fly (lf) B?",
      "4" => "gb (ss) A",
      "5" => "WALK",
      "6" => "gb (p) A",
      "7" => "strikeout",
      "8" => "gb (2b) A+",
      "9" => "strikeout",
      "10" => "HBP",
      "11" => "gb (1b) A",
      "12" => "fly (rf) B?",
    },
    "2" => {
      "2" => "HBP",
      "3" => {
        "1-13" => "SI*",
        "14-20" => "lo (ss)"
      },
      "4" => "WALK",
      "5" => "strikeout",
      "6" => "fly (cf) B?",
      "7" => "gb (1b) C",
      "8" => "strikeout",
      "9" => "strikeout",
      "10" => "strikeout",
      "11" => "HBP plus injury",
      "12" => "lo (3b) max"
    },
    "3" => {
      "2" => "strikeout",
      "3" => "SINGLE (lf)",
      "4" => "gb (ss) A",
      "5" => {
        "1-12" => "DO",
        "13-20" => "fly (lf) B"
      },
      "6" => "popout (2b)",
      "7" => {
        "1-4" => "SI*",
        "5-20" => "gb (2b) B"
      },
      "8" => "SINGLE (lf)",
      "9" => {
        "1-7" => "HR",
        "8-20" => "DO"
      },
      "10" => "SINGLE (lf)",
      "11" => {
        "1-11" => "HR",
        "12-20" => "fly (lf) B"
      },
      "12" => "gb (p) A"
    }
  }
)
