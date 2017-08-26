puts "Creating Orioles players..."
orioles = Team.find_by(name: "Orioles")

Player.create!(
  team: orioles,
  first_name: "Caleb",
  last_name: "Joseph",
  batting_hand: "R",
  stealing: "E",
  running: "1-10",
  avg: 0.234,
  ab: 320,
  doubles: 16,
  triples: 1,
  hr: 11,
  rbi: 49,
  bb: 27,
  so: 72,
  sb: 0,
  cs: 0,
  slg: 0.394,
  obp: 0.299,
  vs_lhp: {
    "1" => {
      "2" => "gb (3b) A",
      "3" => "fly (lf) B?",
      "4" => "gb (2b) C",
      "5" => {
        "1-6" => "TR",
        "7-20" => "SI**"
      },
      "6" => "strikeout",
      "7" => {
        "1-7" => "SI*",
        "8-20" => "lo (3b)"
      },
      "8" => "SINGLE (lf)",
      "9" => {
        "1-12" => "HR",
        "13-20" => "DO"
      },
      "10" => {
        "1-3" => "DO**",
        "4-20" => "SI**"
      },
      "11" => "HOMERUN",
      "12" => "WALK"
    },
    "2" => {
      "2" => "strikeout",
      "3" => "SINGLE (lf)",
      "4" => "gb (2b) C",
      "5" => "strikeout",
      "6" => "fly (lf) B?",
      "7" => "gb (ss) A+",
      "8" => "fly (cf) B?",
      "9" => "strikeout",
      "10" => "foulout (c)",
      "11" => {
        "1-7" => "SI*",
        "8-20" => "lo (ss)"
      },
      "12" => "lo (2b) max"
    },
    "3" => {
      "2" => "fly (rf) B?",
      "3" => "HBP plus injury",
      "4" => "gb (p) A",
      "5" => "strikeout",
      "6" => "popout (ss)",
      "7" => "gb (ss) A",
      "8" => "strikeout",
      "9" => "strikeout",
      "10" => "popout (ss)",
      "11" => "fly (lf) B?",
      "12" => "gb (3b) A"
    }
  },
  vs_rhp: {
    "1" => {
      "2" => "foulout (3b)",
      "3" => "SINGLE (lf)",
      "4" => "gb (p) A",
      "5" => {
        "1-19" => "DO**",
        "20" => "SI**"
      },
      "6" => "fly (lf) B?",
      "7" => "WALK",
      "8" => {
        "1-6" => "SI*",
        "7-20" => "lo (3b)"
      },
      "9" => {
        "1-9" => "HR",
        "10-20" => "DO"
      },
      "10" => "SINGLE (lf)",
      "11" => {
        "1-15" => "HR",
        "16-20" => "fly (lf) B"
      },
      "12" => "fly (lf) B?"
    },
    "2" => {
      "2" => "WALK",
      "3" => {
        "1-8" => "SI*",
        "9-20" => "lo (ss)"
      },
      "4" => "gb (2b) C",
      "5" => "WALK",
      "6" => "fly (cf) B?",
      "7" => "strikeout",
      "8" => "popout (ss)",
      "9" => "strikeout",
      "10" => "foulout (3b)",
      "11" => "HBP plus injury",
      "12" => "lo (2b) max"
    },
    "3" => {
      "2" => "fly (rf) B?",
      "3" => "gb (ss) A",
      "4" => "fly (lf) B?",
      "5" => "strikeout",
      "6" => "popout (ss)",
      "7" => "gb (ss) A+",
      "8" => "strikeout",
      "9" => "gb (3b) A",
      "10" => "popout (ss)",
      "11" => "gb (1b) C",
      "12" => "gb (2b) C"    
    }
  }
)

Player.create!(
  team: orioles,
  first_name: "Jimmy",
  last_name: "Paredes",
  batting_hand: "S",
  stealing: "C",
  running: "1-13",
  avg: 0.275,
  ab: 363,
  doubles: 17,
  triples: 2,
  hr: 10,
  rbi: 42,
  bb: 19,
  so: 111,
  sb: 4,
  cs: 4,
  slg: 0.416,
  obp: 0.310,
  vs_lhp: {
    "1" => {
      "2" => "lo (ss) max",
      "3" => "gb (1b) C plus injury",
      "4" => "gb (3b) A",
      "5" => "fly (rf) B?",
      "6" => "fly (cf) B?",
      "7" => "strikeout",
      "8" => "gb (ss) A+",
      "9" => "fly (rf) B?",
      "10" => "gb (p) B",
      "11" => "gb (3b) B",
      "12" => "fly (cf) B"
    },
    "2" => {
      "2" => "fly (lf) B?",
      "3" => "gb (3b) B",
      "4" => "gb (ss) A",
      "5" => "strikeout",
      "6" => "strikeout",
      "7" => "strikeout",
      "8" => "gb (ss) A",
      "9" => "gb (2b) C",
      "10" => "gb (ss) A",
      "11" => "foulout (1b)",
      "12" => "gb (ss) A+"
    },
    "3" => {
      "2" => "gb (p) B",
      "3" => "WALK",
      "4" => "DOUBLE (rf)",
      "5" => {
        "1-12" => "DO**",
        "13-20" => "SI**"
      },
      "6" => "SINGLE (rf)",
      "7" => "SINGLE**",
      "8" => "SINGLE*",
      "9" => "strikeout",
      "10" => {
        "1-7" => "SI*",
        "8-20" => "lo (ss)"
      },
      "11" => "SINGLE (rf)",
      "12" => {
        "1-13" => "SI*",
        "14-20" => "lo (ss)"
      }
    }
  },
  vs_rhp: {
    "1" => {
      "2" => {
        "1-14" => "SI*",
        "15-20" => "lo (2b)"
      },
      "3" => "fly (rf) B?",
      "4" => "gb (1b) A+",
      "5" => "strikeout",
      "6" => "strikeout",
      "7" => "gb (2b) A",
      "8" => "strikeout",
      "9" => "strikeout",
      "10" => "gb (1b) A+",
      "11" => "gb (2b) A plus injury",
      "12" => "WALK"
    },
    "2" => {
      "2" => "lo (2b) max",
      "3" => "gb (p) A",
      "4" => "strikeout",
      "5" => "SINGLE (lf)",
      "6" => "SINGLE**",
      "7" => "SINGLE**",
      "8" => "strikeout",
      "9" => "strikeout",
      "10" => {
        "1-10" => "SI*",
        "11-20" => "gb (2b) A",
      },
      "11" => "gb (p) A",
      "12" => "gb (1b) A"
    },
    "3" => {
      "2" => "fly (cf) B?",
      "3" => "SINGLE (lf)",
      "4" => {
        "1-16" => "HR",
        "17-20" => "TR"
      },
      "5" => {
        "1" => "TR",
        "2-20" => "DO"
      },
      "6" => "strikeout",
      "7" => "gb (1b) C",
      "8" => "strikeout",
      "9" => "strikeout",
      "10" => {
        "1" => "DO**",
        "2-20" => "SI**"
      },
      "11" => {
        "1-13" => "HR",
        "14-20" => "fly (lf) B"
      },
      "12" => "WALK"
    }
  }
)

Player.create!(
  team: orioles,
  first_name: "Gerardo",
  last_name: "Parra",
  batting_hand: "L",
  stealing: "B",
  running: "1-13",
  avg: 0.237,
  ab: 224,
  doubles: 12,
  triples: 0,
  hr: 5,
  rbi: 20,
  bb: 8,
  so: 35,
  sb: 5,
  cs: 1,
  slg: 0.357,
  obp: 0.268,
  vs_lhp: {
    "1" => {
      "2" => "HBP",
      "3" => "popout (2b)",
      "4" => "foulout (3b)",
      "5" => "gb (ss) B",
      "6" => "fly (lf) B?",
      "7" => "strikeout",
      "8" => "popout (2b)",
      "9" => "gb (1b) B",
      "10" => "gb (3b) B",
      "11" => "gb (2b) B",
      "12" => "HBP plus injury"
    },
    "2" => {
      "2" => "lo (2b) max",
      "3" => "gb (1b) C",
      "4" => "gb (1b) B",
      "5" => "gb (p) B",
      "6" => "fly (cf) B?",
      "7" => "strikeout",
      "8" => "gb (1b) B",
      "9" => "gb (2b) B",
      "10" => "gb (p) B",
      "11" => "gb (2b) B+",
      "12" => {
        "1-5" => "SI*",
        "6-20" => "lo (2b)"
      },
    },
    "3" => {
      "2" => {
        "1-13" => "HR",
        "14-20" => "fly (lf) B"
      },
      "3" => {
        "1" => "SI*",
        "2-20" => "lo (2b)",
      },
      "4" => "lineout (1b)",
      "5" => "gb (2b) C",
      "6" => {
        "1-3" => "HR",
        "4-20" => "fly (lf) B"
      },
      "7" => "SINGLE (cf)",
      "8" => "lineout (1b)",
      "9" => "gb (2b) B+",
      "10" => "SINGLE (lf)",
      "11" => "SINGLE (lf)",
      "12" => "fly (cf) B?"
    }
  },
  vs_rhp: {
    "1" => {
      "2" => "HBP",
      "3" => "foulout (c)",
      "4" => "gb (ss) B",
      "5" => "gb (p) B",
      "6" => "strikeout",
      "7" => "fly (cf) B?",
      "8" => "popout (ss)",
      "9" => "gb (2b) C",
      "10" => "gb (2b) B",
      "11" => "gb (3b) B",
      "12" => "HBP plus injury"
    },
    "2" => {
      "2" => "lo (2b) max",
      "3" => "gb (3b) B",
      "4" => "gb (p) B",
      "5" => "strikeout",
      "6" => "gb (ss) B",
      "7" => "gb (2b) B+",
      "8" => "gb (1b) B",
      "9" => "fly (lf) B?",
      "10" => "fly (lf) B?",
      "11" => "gb (1b) C",
      "12" => {
        "1-5" => "SI*",
        "6-20" => "lo (2b)"
      }
    },
    "3" => {
      "2" => {
        "1-13" => "HR",
        "14-20" => "fly (lf) B"
      },
      "3" => "fly (rf) B?",
      "4" => "popout (2b)",
      "5" => {
        "1-17" => "SI*",
        "18-20" => "lo (2b)"
      },
      "6" => {
        "1-5" => "HR",
        "6-20" => "DO"
      },
      "7" => {
        "1-4" => "DO**",
        "5-20" => "SI**"
      },
      "8" => "lineout (1b)",
      "9" => "SINGLE**",
      "10" => "DOUBLE (lf)",
      "11" => "SINGLE (lf)",
      "12" => "gb (ss) B"
    }
  }
)

Player.create!(
  team: orioles,
  first_name: "Jonathan",
  last_name: "Schoop",
  batting_hand: "R",
  stealing: "E",
  running: "1-12",
  avg: 0.279,
  ab: 305,
  doubles: 17,
  triples: 0,
  hr: 15,
  rbi: 39,
  bb: 9,
  so: 79,
  sb: 2,
  cs: 0,
  slg: 0.482,
  obp: 0.306,
  vs_lhp: {
    "1" => {
      "2" => "fly (lf) B?",
      "3" => "gb (3b) A",
      "4" => "gb (ss) A",
      "5" => "strikeout plus injury",
      "6" => "strikeout",
      "7" => "strikeout",
      "8" => "strikeout",
      "9" => "strikeout",
      "10" => "gb (ss) A",
      "11" => {
        "1-17" => "SI*",
        "18-20" => "lo (ss)"
      },
      "12" => "gb (2b) C"
    },
    "2" => {
      "2" => "fly (rf) B?",
      "3" => "fly (lf) B?",
      "4" => {
        "1-6" => "HR",
        "7-20" => "fly (lf) B"
      },
      "5" => "SINGLE (lf)",
      "6" => "SINGLE (lf)",
      "7" => "SINGLE**",
      "8" => "SINGLE**",
      "9" => "strikeout",
      "10" => "strikeout",
      "11" => "SINGLE (lf)",
      "12" => "strikeout"
    },
    "3" => {
      "2" => "lo (3b) max",
      "3" => "gb (3b) A",
      "4" => "HBP",
      "5" => "strikeout",
      "6" => "gb (1b) C",
      "7" => "gb (ss) A+",
      "8" => "fly (cf) B?",
      "9" => "strikeout",
      "10" => "gb (p) A",
      "11" => "gb (3b) A",
      "12" => "gb (p) A"
    }
  },
  vs_rhp: {
    "1" => {
      "2" => "gb (p) A",
      "3" => {
        "1-13" => "SI*",
        "14-20" => "lo (ss)"
      },
      "4" => "fly (rf) B?",
      "5" => {
        "1-9" => "SI*",
        "10-20" => "lo (3b)"
      },
      "6" => "SINGLE**",
      "7" => "gb (ss) A+",
      "8" => "SINGLE**",
      "9" => "strikeout plus injury",
      "10" => "gb (p) A",
      "11" => "gb (2b) C",
      "12" => "gb (3b) A"
    },
    "2" => {
      "2" => "fly (cf) B?",
      "3" => "gb (2b) C",
      "4" => "HOMERUN",
      "5" => {
        "1-13" => "HR",
        "14-20" => "DO"
      },
      "6" => {
        "1-16" => "HR",
        "17-20" => "fly (lf) B"
      },
      "7" => "DOUBLE (lf)",
      "8" => {
        "1-9" => "DO",
        "10-20" => "fly (cf) B"
      },
      "9" => "strikeout",
      "10" => "fly (lf) B?",
      "11" => "SINGLE (cf)",
      "12" => "SINGLE (rf)"
    },
    "3" => {
      "2" => "lo (3b) max",
      "3" => "gb (ss) A",
      "4" => "HBP",
      "5" => "strikeout",
      "6" => "strikeout",
      "7" => "gb (3b) A",
      "8" => "strikeout",
      "9" => "strikeout",
      "10" => "fly (cf) B?",
      "11" => "gb (ss) A",
      "12" => "fly (cf) A"
    }
  }
)

Player.create!(
  team: orioles,
  first_name: "Adam",
  last_name: "Jones",
  batting_hand: "R",
  stealing: "D",
  running: "1-14",
  avg: 0.269,
  ab: 546,
  doubles: 25,
  triples: 3,
  hr: 27,
  rbi: 82,
  bb: 24,
  so: 102,
  sb: 3,
  cs: 1,
  slg: 0.474,
  obp: 0.308,
  vs_lhp: {
    "1" => {
      "2" => "HBP plus injury",
      "3" => "gb (1b) C",
      "4" => "gb (p) A",
      "5" => "strikeout",
      "6" => "gb (ss) A",
      "7" => "strikeout",
      "8" => "strikeout",
      "9" => "strikeout",
      "10" => "gb (ss) A",
      "11" => "gb (2b) C",
      "12" => {
        "1-11" => "SI*",
        "12-20" => "lo (ss)"
      }
    },
    "2" => {
      "2" => "gb (ss) A",
      "3" => "SINGLE (cf)",
      "4" => "strikeout",
      "5" => "SINGLE (cf)",
      "6" => {
        "1-5" => "DO**",
        "6-20" => "SI**"
      },
      "7" => "gb (ss) A+",
      "8" => {
        "1-14" => "HR",
        "15-20" => "DO"
      },
      "9" => "DOUBLE (lf)",
      "10" => {
        "1-17" => "HR",
        "18-20" => "fly (lf) B"
      },
      "11" => "fly (lf) B?",
      "12" => "SINGLE (rf)"
    },
    "3" => {
      "2" => "strikeout",
      "3" => "HBP",
      "4" => "gb (p) A",
      "5" => "strikeout",
      "6" => "strikeout",
      "7" => "gb (3b) A",
      "8" => {
        "1-11" => "SI*",
        "12-20" => "gb (2b) A"
      },
      "9" => "strikeout",
      "10" => "gb (3b) A",
      "11" => "gb (1b) C",
      "12" => "lo (3b) max"
    }
  },
  vs_rhp: {
    "1" => {
      "2" => "fly (cf) A",
      "3" => "gb (2b) C",
      "4" => "gb (1b) A",
      "5" => "gb (ss) A",
      "6" => "fly (cf) B?",
      "7" => "fly (lf) B?",
      "8" => "strikeout",
      "9" => "gb (ss) A",
      "10" => "popout (ss)",
      "11" => "foulout (c)",
      "12" => {
        "1-11" => "SI*",
        "12-20" => "lo (ss)"
      }
    },
    "2" => {
      "2" => "gb (2b) A",
      "3" => "HBP",
      "4" => "gb (2b) A",
      "5" => {
        "1-10" => "DO**",
        "11-20" => "SI**"
      },
      "6" => {
        "1-4" => "TR",
        "5-20" => "SI**"
      },
      "7" => "gb (ss) A+",
      "8" => {
        "1-15" => "HR",
        "16-20" => "DO"
      },
      "9" => {
        "1-18" => "HR",
        "19-20" => "fly (lf) B"
      },
      "10" => "fly (lf) B?",
      "11" => "SINGLE (lf)",
      "12" => "WALK"
    },
    "3" => {
      "2" => "lo (3b) max",
      "3" => "gb (1b) C",
      "4" => "gb (3b) A",
      "5" => "SINGLE (lf)",
      "6" => {
        "1-2" => "SI*",
        "3-20" => "lo (3b)"
      },
      "7" => "gb (p) A",
      "8" => "SINGLE (lf)",
      "9" => "strikeout",
      "10" => "gb (3b) A",
      "11" => "gb (2b) C",
      "12" => "HBP plus injury"
    }
  }
)

Player.create!(
  team: orioles,
  first_name: "Chris",
  last_name: "Davis",
  batting_hand: "L",
  stealing: "E",
  running: "1-11",
  avg: 0.262,
  ab: 573,
  doubles: 31,
  triples: 0,
  hr: 47,
  rbi: 117,
  bb: 84,
  so: 208,
  sb: 2,
  cs: 3,
  slg: 0.562,
  obp: 0.361,
  vs_lhp: {
    "1" => {
      "2" => "fly (lf) B?",
      "3" => "SINGLE (cf)",
      "4" => "gb (2b) A+",
      "5" => {
        "1-12" => "SI*",
        "13-20" => "gb (2b) A"
      },
      "6" => {
        "1-16" => "HR",
        "17-20" => "DO"
      },
      "7" => {
        "1-7" => "DO**",
        "8-20" => "SI**"
      },
      "8" => "strikeout",
      "9" => "SINGLE (rf)",
      "10" => "HOMERUN",
      "11" => {
        "1-10" => "HR",
        "11-20" => "fly (lf) B"
      },
      "12" => "gb (ss) A"
    },
    "2" => {
      "2" => {
        "1-17" => "SI*",
        "18-20" => "lo (2b)"
      },
      "3" => "HBP",
      "4" => "gb (2b) A+",
      "5" => "strikeout",
      "6" => "strikeout",
      "7" => "WALK",
      "8" => "strikeout",
      "9" => "strikeout",
      "10" => "gb (1b) C",
      "11" => "strikeout",
      "12" => "HBP plus injury"
    },
    "3" => {
      "2" => "lo (1b) max",
      "3" => "strikeout",
      "4" => "strikeout",
      "5" => "strikeout",
      "6" => "strikeout",
      "7" => "strikeout",
      "8" => "strikeout",
      "9" => "strikeout",
      "10" => "WALK",
      "11" => "SINGLE (cf)",
      "12" => "SINGLE (cf)"
    }
  },
  vs_rhp: {
    "1" => {
      "2" => {
        "1-16" => "DO",
        "17-20" => "fly (rf) B"
      },
      "3" => "fly (lf) B?",
      "4" => "gb (2b) A+",
      "5" => "gb (2b) C",
      "6" => "HOMERUN",
      "7" => {
        "1-4" => "HR",
        "5-20" => "DO"
      },
      "8" => "strikeout",
      "9" => "HOMERUN",
      "10" => "HOMERUN",
      "11" => {
        "1-14" => "HR",
        "15-20" => "fly (lf) B"
      },
      "12" => "gb (2b) A+"
    },
    "2" => {
      "2" => "fly (cf) A",
      "3" => "WALK",
      "4" => "strikeout", 
      "5" => "strikeout", 
      "6" => "WALK",
      "7" => {
        "1-3" => "SI*",
        "4-20" => "gb (2b) A"
      },
      "8" => "strikeout",
      "9" => "strikeout",
      "10" => "strikeout",
      "11" => "gb (2b) A+",
      "12" => "HBP plus injury"
    },
    "3" => {
      "2" => "lo (1b) max",
      "3" => "HBP",
      "4" => "strikeout",
      "5" => "WALK",
      "6" => "WALK",
      "7" => "strikeout",
      "8" => "WALK",
      "9" => "strikeout",
      "10" => "strikeout",
      "11" => "strikeout",
      "12" => "gb (1b) C"
    }
  }
)

Player.create!(
  team: orioles,
  first_name: "Manny",
  last_name: "Machado",
  batting_hand: "R",
  stealing: "A",
  running: "1-15",
  avg: 0.286,
  ab: 633,
  doubles: 30,
  triples: 1,
  hr: 35,
  rbi: 86,
  bb: 70,
  so: 111,
  sb: 20,
  cs: 8,
  slg: 0.502,
  obp: 0.359,
  vs_lhp: {
    "1" => {
      "2" => "SINGLE (lf)",
      "3" => "SINGLE (lf)",
      "4" => {
        "1-19" => "HR",
        "20" => "DO"
      },
      "5" => {
        "1-9" => "DO**",
        "10-20" => "SI**"
      },
      "6" => "WALK",
      "7" => "WALK",
      "8" => "strikeout",
      "9" => "gb (p) A",
      "10" => {
        "1-17" => "HR",
        "18-20" => "fly (lf) B"
      },
      "11" => "fly (lf) B?",
      "12" => "gb (2b) A"
    },
    "2" => {
      "2" => "fly (rf) B?",
      "3" => "gb (2b) C",
      "4" => "foulout (c)",
      "5" => "fly (lf) B?",
      "6" => "popout (ss)",
      "7" => "lineout (2b)",
      "8" => "gb (3b) A",
      "9" => "strikeout",
      "10" => "fly (lf) B?",
      "11" => "gb (2b) C",
      "12" => "HBP"
    },
    "3" => {
      "2" => "lo (3b) max",
      "3" => "gb (1b) C",
      "4" => "strikeout",
      "5" => "SINGLE (lf)",
      "6" => "SINGLE (lf)",
      "7" => "gb (ss) A+",
      "8" => "fly (cf) B?",
      "9" => "strikeout",
      "10" => {
        "1-12" => "SI*",
        "13-20" => "gb (1b) B"
      },
      "11" => "gb (ss) A",
      "12" => "WALK"
    }
  },
  vs_rhp: {
    "1" => {
      "2" => "SINGLE (lf)",
      "3" => "WALK",
      "4" => "HOMERUN",
      "5" => {
        "1-6" => "HR",
        "7-20" => "DO"
      },
      "6" => {
        "1-16" => "HR",
        "17-20" => "fly (lf) B"
      },
      "7" => {
        "1-6" => "DO**",
        "7-20" => "SI**"
      },
      "8" => "WALK",
      "9" => "popout (ss)",
      "10" => "fly (lf) B?",
      "11" => "SINGLE (lf)",
      "12" => "fly (rf) B?"
    },
    "2" => {
      "2" => "fly (cf) A",
      "3" => "foulout (c)",
      "4" => "gb (3b) A",
      "5" => "gb (2b) C",
      "6" => "fly (cf) B?",
      "7" => "popout (3b)",
      "8" => "fly (lf) B?",
      "9" => "strikeout",
      "10" => "gb (ss) A",
      "11" => "gb (1b) C",
      "12" => "HBP"
    },
    "3" => {
      "2" => "lo (3b) max",
      "3" => "gb (3b) A",
      "4" => "gb (p) A",
      "5" => "SINGLE (lf)",
      "6" => "SINGLE**",
      "7" => "gb (ss) A+",
      "8" => "strikeout",
      "9" => "WALK",
      "10" => {
        "1-12" => "SI*",
        "13-20" => "lo (3b)"
      },
      "11" => "WALK",
      "12" => "WALK"
    }
  }
)

Player.create!(
  team: orioles,
  first_name: "Steve",
  last_name: "Pearce",
  batting_hand: "R",
  stealing: "E",
  running: "1-12",
  avg: 0.218,
  ab: 294,
  doubles: 13,
  triples: 1,
  hr: 15,
  rbi: 40,
  bb: 23,
  so: 69,
  sb: 1,
  cs: 1,
  slg: 0.422,
  obp: 0.289,
  vs_lhp: {
    "1" => {
      "2" => "foulout (3b)",
      "3" => "foulout (c)",
      "4" => "fly (rf) B?",
      "5" => {
        "1" => "SI*",
        "2-20" => "lo (ss)"
      },
      "6" => "popout (ss)",
      "7" => "gb (ss) A",
      "8" => "gb (ss) A",
      "9" => "gb (p) A",
      "10" => "fly (lf) B?",
      "11" => "gb (1b) C",
      "12" => "gb (2b) C"
    },
    "2" => {
      "2" => "lo (3b) max",
      "3" => "HBP",
      "4" => "WALK",
      "5" => "strikeout",
      "6" => "fly (cf) B?",
      "7" => "gb (3b) A",
      "8" => "strikeout",
      "9" => "strikeout",
      "10" => "HBP plus injury",
      "11" => "SINGLE (cf)",
      "12" => "SINGLE (cf)"
    },
    "3" => {
      "2" => "fly (lf) B?",
      "3" => {
        "1" => "DO**",
        "2-20" => "SI**"
      },
      "4" => "gb (2b) C",
      "5" => {
        "1-6" => "TR",
        "7-20" => "fly (lf) B"
      },
      "6" => "lineout (3b)",
      "7" => "gb (ss) A+",
      "8" => "strikeout",
      "9" => {
        "1-12" => "HR",
        "13-20" => "DO"
      },
      "10" => "WALK",
      "11" => {
        "1-15" => "HR",
        "16-20" => "fly (lf) B"
      },
      "12" => "foulout (3b)"
    }
  },
  vs_rhp: {
    "1" => {
      "2" => "fly (cf) A",
      "3" => "gb (ss) A",
      "4" => "fly (cf) B?",
      "5" => {
        "1-16" => "SI*",
        "17-20" => "lo (ss)"
      },
      "6" => "gb (2b) C",
      "7" => "strikeout",
      "8" => "gb (3b) A",
      "9" => "strikeout",
      "10" => "HBP plus injury",
      "11" => "gb (ss) A",
      "12" => "lo (3b) max"
    },
    "2" => {
      "2" => "WALK",
      "3" => "gb (ss) A",
      "4" => "fly (lf) B?",
      "5" => "strikeout",
      "6" => "gb (p) A",
      "7" => "gb (ss) A+",
      "8" => "strikeout",
      "9" => "strikeout",
      "10" => "strikeout",
      "11" => "HBP",
      "12" => "WALK"
    },
    "3" => {
      "2" => "SINGLE (lf)",
      "3" => "SINGLE (cf)",
      "4" => "fly (rf) B?",
      "5" => {
        "1-2" => "HR",
        "3-20" => "DO"
      },
      "6" => "gb (1b) A",
      "7" => "WALK",
      "8" => {
        "1-3" => "DO",
        "4-20" => "fly (cf) B"
      },
      "9" => "HOMERUN",
      "10" => "HOMERUN",
      "11" => {
        "1-10" => "HR",
        "11-20" => "fly (lf) B"
      },
      "12" => "gb (1b) C"
    }
  }
)

Player.create!(
  team: orioles,
  first_name: "J.J.",
  last_name: "Hardy",
  batting_hand: "R",
  stealing: "E",
  running: "1-11",
  avg: 0.219,
  ab: 411,
  doubles: 14,
  triples: 0,
  hr: 8,
  rbi: 37,
  bb: 20,
  so: 88,
  sb: 0,
  cs: 0,
  slg: 0.311,
  obp: 0.253,
  vs_lhp: {
    "1" => {
      "2" => "gb (2b) A",
      "3" => "gb (1b) B",
      "4" => "fly (lf) B?",
      "5" => "fly (lf) B?",
      "6" => "fly (cf) B?",
      "7" => "gb (ss) A+",
      "8" => "strikeout",
      "9" => "strikeout",
      "10" => "gb (ss) A plus injury",
      "11" => "gb (1b) C",
      "12" => "lo (3b) max"
    },
    "2" => {
      "2" => {
        "1-8" => "SI*",
        "9-20" => "lo (ss)"
      },
      "3" => "gb (3b) A",
      "4" => "foulout (3b)",
      "5" => "SINGLE (lf)",
      "6" => "popout (ss)",
      "7" => "strikeout",
      "8" => {
        "1-19" => "SI*",
        "20" => "gb (1b) B"
      },
      "9" => {
        "1-9" => "HR",
        "10-20" => "fly (lf) B"
      },
      "10" => "SINGLE (cf)",
      "11" => "SINGLE (lf)",
      "12" => "foulout (c)"
    },
    "3" => {
      "2" => "gb (p) B",
      "3" => "popout (2b)",
      "4" => "gb (2b) C",
      "5" => "strikeout",
      "6" => "gb (p) B",
      "7" => "strikeout",
      "8" => "gb (3b) A",
      "9" => "gb (ss) A",
      "10" => "gb (2b) A",
      "11" => "popout (2b)",
      "12" => "gb (2b) C" 
    }
  },
  vs_rhp: {
    "1" => {
      "2" => "lo (3b) max",
      "3" => "foulout (c)",
      "4" => "strikeout plus injury",
      "5" => "strikeout",
      "6" => "gb (ss) A",
      "7" => "gb (ss) A+",
      "8" => "strikeout",
      "9" => "strikeout",
      "10" => "fly (rf) B?",
      "11" => "gb (3b) B",
      "12" => {
        "1-8" => "SI*",
        "9-20" => "lo (ss)"
      }
    },
    "2" => {
      "2" => {
        "1-10" => "HR",
        "11-20" => "fly (lf) B"
      },
      "3" => "gb (1b) C",
      "4" => "gb (2b) C",
      "5" => {
        "1-2" => "DO**",
        "3-20" => "SI**"
      },
      "6" => "popout (ss)",
      "7" => "fly (lf) B?",
      "8" => {
        "1-19" => "SI*",
        "20" => "gb (ss) B"
      },
      "9" => {
        "1-6" => "HR",
        "7-20" => "DO"
      },
      "10" => "SINGLE (rf)",
      "11" => "SINGLE (rf)",
      "12" => "gb (1b) B"
    },
    "3" => {
      "2" => "gb (2b) C",
      "3" => "popout (2b)",
      "4" => "gb (3b) A",
      "5" => "WALK",
      "6" => "gb (p) B",
      "7" => "fly (cf) B?",
      "8" => "gb (3b) A",
      "9" => "strikeout",
      "10" => "gb (ss) A",
      "11" => "foulout (3b)",
      "12" => "gb (ss) A"
    }
  }
)
