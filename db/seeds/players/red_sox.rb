puts "Creating Red Sox players..."
red_sox = Team.find_by(name: "Red Sox")

Player.create!(
  team: red_sox,
  first_name: "Mookie",
  last_name: "Betts",
  batting_hand: "R",
  stealing: "A",
  running: "1-16",
  avg: 0.291,
  ab: 597,
  doubles: 42,
  triples: 8,
  hr: 18,
  rbi: 77,
  bb: 46,
  so: 82,
  sb: 21,
  cs: 6,
  slg: 0.479,
  obp: 0.341,
  vs_lhp: {
    "1" => {
      "2" => "lineout (1b)",
      "3" => "foulout (3b)",
      "4" => "lineout (3b)",
      "5" => "SINGLE**",
      "6" => "SINGLE (rf)",
      "7" => {
        "1-11" => "SI*",
        "12-20" => "lo (3b)"
      },
      "8" => "SINGLE**",
      "9" => "gb (2b) C",
      "10" => "popout (2b)",
      "11" => "popout (2b)",
      "12" => "lineout (1b)",
    },
    "2" => {
      "2" => "lineout (1b)",
      "3" => "SINGLE (lf)",
      "4" => {
        "1-15" => "HR",
        "16-20" => "TR"
      },
      "5" => {
        "1-7" => "DO**",
        "8-20" => "SI**"
      },
      "6" => {
        "1-5" => "DO**",
        "6-20" => "SI**"
      },
      "7" => "gb (ss) B+",
      "8" => "WALK",
      "9" => "popout (ss)",
      "10" => "fly (rf) B?",
      "11" => {
        "1-12" => "HR",
        "13-20" => "fly (lf) B"
      },
      "12" => "fly (lf) B?"
    },
    "3" => {
      "2" => "lo (3b) max",
      "3" => "gb (1b) C",
      "4" => "SINGLE (cf)",
      "5" => "popout (ss)",
      "6" => "fly (lf) B?",
      "7" => "popout (ss)",
      "8" => "fly (cf) B?",
      "9" => "lineout (3b)",
      "10" => "popout (ss)",
      "11" => "foulout (c)",
      "12" => "HBP plus injury"
    }
  },
  vs_rhp: {
    "1" => {
      "2" => "lo (3b) max",
      "3" => "lineout (3b)",
      "4" => "lineout (3b)",
      "5" => "fly (lf) B?",
      "6" => "SINGLE**",
      "7" => "strikeout",
      "8" => {
        "1-7" => "SI*",
        "8-20" => "lo (3b)"
      },
      "9" => "fly (lf) B?",
      "10" => "popout (2b)",
      "11" => "popout (2b)",
      "12" => "HBP plus injury"
    },
    "2" => {
      "2" => "fly (rf) B?",
      "3" => "gb (1b) C",
      "4" => {
        "1-12" => "HR",
        "13-20" => "TR"
      },
      "5" => {
        "1-4" => "TR",
        "5-20" => "DO"
      },
      "6" => "DOUBLE (lf)",
      "7" => {
        "1-7" => "DO**",
        "8-20" => "SI**"
      },
      "8" => "WALK",
      "9" => "gb (2b) C",
      "10" => "WALK",
      "11" => "SINGLE (lf)",
      "12" => {
        "1-16" => "HR",
        "17-20" => "fly (lf) B"
      }
    },
    "3" => {
      "2" => "fly (lf) B?",
      "3" => "foulout (c)",
      "4" => "SINGLE**",
      "5" => "popout (ss)",
      "6" => "fly (cf) B?",
      "7" => "gb (ss) B+",
      "8" => "popout (ss)",
      "9" => "popout (ss)",
      "10" => "lineout (3b)",
      "11" => "foulout (3b)",
      "12" => "WALK"
    }
  }
)

Player.create!(
  team: red_sox,
  first_name: "Xander",
  last_name: "Bogaerts",
  batting_hand: "R",
  stealing: "B",
  running: "1-14",
  avg: 0.320,
  ab: 613,
  doubles: 35,
  triples: 3,
  hr: 7,
  rbi: 81,
  bb: 32,
  so: 101,
  sb: 10,
  cs: 2,
  slg: 0.421,
  obp: 0.355,
  vs_lhp: {
    "1" => {
      "2" => "lo (3b) max",
      "3" => {
        "1-4" => "SI*",
        "5-20" => "lo (ss)"
      }, 
      "4" => {
        "1-17" => "HR",
        "18-20" => "TR"
      },
      "5" => {
        "1" => "TR",
        "2-20" => "DO"
      },
      "6" => {
        "1-2" => "DO**",
        "3-20" => "SI**"
      },
      "7" => "WALK",
      "8" => "WALK",
      "9" => "gb (ss) A",
      "10" => "strikeout",
      "11" => "SINGLE (lf)",
      "12" => "gb (2b) C"
    },
    "2" => {
      "2" => "gb (3b) A",
      "3" => "gb (p) B",
      "4" => "gb (2b) C",
      "5" => "fly (lf) B?",
      "6" => "fly (cf) B?",
      "7" => "gb (ss) A+",
      "8" => "fly (lf) B?",
      "9" => "strikeout",
      "10" => "gb (3b) A",
      "11" => "gb (1b) C",
      "12" => "fly (rf) B?"
    },
    "3" => {
      "2" => "HBP plus injury",
      "3" => "gb (ss) A",
      "4" => "gb (ss) A",
      "5" => "SINGLE (lf)",
      "6" => "SINGLE**",
      "7" => "SINGLE**",
      "8" => {
        "1-13" => "SI*",
        "14-20" => "gb (3b) B"
      },
      "9" => "SINGLE**",
      "10" => "SINGLE*",
      "11" => "SINGLE*",
      "12" => "SINGLE (lf)"
    } 
  },
  vs_rhp: {
    "1" => {
      "2" => "lo (3b) max",
      "3" => {
        "1-4" => "SI*",
        "5-20" => "lo (ss)"
      },
      "4" => {
       "1-16" => "HR",
       "17-20" => "DO"
      },
      "5" => {
        "1-2" => "TR",
        "3-20" => "DO"
      },
      "6" => {
        "1-11" => "DO**",
        "12-20" => "SI**"
      },
      "7" => "strikeout",
      "8" => "fly (lf) B",
      "9" => "gb (ss) A",
      "10" => "gb (ss) A",
      "11" => "SINGLE (lf)",
      "12" => "gb (3b) B"
    },
    "2" => {
      "2" => "gb (2b) C",
      "3" => "foulout (3b)",
      "4" => "gb (3b) B",
      "5" => "gb (ss) A",
      "6" => "gb (3b) A",
      "7" => "strikeout",
      "8" => "gb (ss) A+",
      "9" => "fly (lf) B?",
      "10" => "gb (p) B",
      "11" => "foulout (c)",
      "12" => "gb (ss) A+"
    },
    "3" => {
      "2" => "fly (rf) B?",
      "3" => "gb (p) B",
      "4" => "gb (2b) C",
      "5" => "SINGLE (lf)",
      "6" => "SINGLE**",
      "7" => {
        "1-16" => "SI*",
        "17-20" => "lo (3b)"
      },
      "8" => "fly (cf) B?",
      "9" => "SINGLE**",
      "10" => "SINGLE*",
      "11" => "gb (1b) C",
      "12" => "HBP plus injury"
    }
  }
)

Player.create!(
  team: red_sox,
  first_name: "David",
  last_name: "Ortiz",
  batting_hand: "L",
  stealing: "E",
  running: "1-8",
  avg: 0.273,
  ab: 528,
  doubles: 37,
  triples: 0,
  hr: 37,
  rbi: 108,
  bb: 77,
  so: 95,
  sb: 0,
  cs: 1,
  slg: 0.553,
  obp: 0.360,
  vs_lhp: {
    "1" => {
      "2" => "SINGLE (cf)",
      "3" => "gb (1b) C",
      "4" => "gb (p) A",
      "5" => "strikeout",
      "6" => "strikeout",
      "7" => "gb (ss) A+",
      "8" => "gb (p) A",
      "9" => "strikeout",
      "10" => "fly (cf) B?",
      "11" => "SINGLE (lf)",
      "12" => {
        "1-10" => "SI*",
        "11-20" => "lo (2b)"
      }
    },
    "2" => {
      "2" => "fly (cf) B?",
      "3" => "SINGLE (rf)",
      "4" => "foulout (C)",
      "5" => {
        "1-8" => "SI*",
        "9-20" => "lo (1b)"
      },
      "6" => "HOMERUN",
      "7" => {
        "1-13" => "DO",
        "14-20" => "fly (cf) B"
      },
      "8" => "popout (ss)",
      "9" => "fly (lf) B?",
      "10" => {
        "1-15" => "HR",
        "16-20" => "fly (lf) B"
      },
      "11" => {
        "1" => "HR",
        "2-20" => "DO"
      },
      "12" => "gb (ss) A plus injury"
    },
    "3" => {
      "2" => "lo (2b) max",
      "3" => "gb (2b) C",
      "4" => "gb (3b) A",
      "5" => "fly (rf) B?",
      "6" => "strikeout",
      "7" => "WALK",
      "8" => "gb (ss) A",
      "9" => "strikeout",
      "10" => "gb (2b) A",
      "11" => "gb (2b) C",
      "12" => "WALK"
    }
  },
  vs_rhp: {
    "1" => {
      "2" => {
        "1-10" => "SI*",
        "11-20" => "lo (2b)"
      },
      "3" => {
        "1-2" => "HR",
        "3-20" => "fly (rf) B" 
      },
      "4" => "fly (cf) B?",
      "5" => "WALK",
      "6" => "WALK",
      "7" => "gb (2b) A+",
      "8" => "WALK",
      "9" => "strikeout",
      "10" => "WALK",
      "11" => "SINGLE (cf)",
      "12" => "gb (1b) C"
    },
    "2" => {
      "2" => "fly (lf) B?",
      "3" => "SINGLE (lf)",
      "4" => "gb (2b) C",
      "5" => "DOUBLE (lf)",
      "6" => "HOMERUN",
      "7" => {
        "1-8" => "HR",
        "9-20" => "DO"
      },
      "8" => "popout (2b)",
      "9" => "fly (lf) B?",
      "10" => "HOMERUN",
      "11" => "HOMERUN",
      "12" => "fly (cf) A plus injury"
    },
    "3" => {
      "2" => "lo (2b) max",
      "3" => "gb (1b) C",
      "4" => "gb (3b) A",
      "5" => "gb (ss) A",
      "6" => {
        "1-7" => "SI*",
        "8-20" => "lo (1b)"
      },
      "7" => {
        "1-5" => "DO",
        "6-20" => "fly (cf) B" 
      },
      "8" => "gb (p) A",
      "9" => "strikeout",
      "10" => "gb (1b) A",
      "11" => "gb (ss) A",
      "12" => "SINGLE**"
    }
  }
)

Player.create!(
  team: red_sox,
  first_name: "Dustin",
  last_name: "Pedroia",
  batting_hand: "R",
  stealing: "D",
  running: "1-12",
  avg: 0.291,
  ab: 381,
  doubles: 19,
  triples: 1,
  hr: 12,
  rbi: 42,
  bb: 38,
  so: 51,
  sb: 2,
  cs: 2,
  slg: 0.441,
  obp: 0.356,
  vs_lhp: {
    "1" => {
      "2" => "HBP",
      "3" => "fly (lf) B?",
      "4" => "fly (rf) B?",
      "5" => "strikeout",
      "6" => "strikeout",
      "7" => "gb (ss) A+",
      "8" => "fly (cf) B?",
      "9" => "gb (2b) C",
      "10" => "gb (p) B",
      "11" => "gb (1b) C",
      "12" => {
        "1-4" => "SI*",
        "5-20" => "lo (ss)"
      }
    },
    "2" => {
      "2" => "foulout (c)",
      "3" => "gb (3b) B",
      "4" => "WALK",
      "5" => "SINGLE**",
      "6" => "WALK",
      "7" => "WALK",
      "8" => "gb (ss) A",
      "9" => "gb (ss) B",
      "10" => "WALK",
      "11" => "gb (3b) B",
      "12" => "foulout (c)"
    },
    "3" => {
      "2" => "foulout (3b)",
      "3" => "SINGLE (cf)",
      "4" => {
        "1-19" => "HR",
        "20" => "DO"
      },
      "5" => "DOUBLE (lf)",
      "6" => {
        "1-11" => "DO",
        "12-20" => "fly (lf) B"
      },
      "7" => "SINGLE (cf)",
      "8" => {
        "1-5" => "SI*",
        "6-20" => "lo (ss)"
      },
      "9" => "strikeout plus injury",
      "10" => {
        "1-14" => "HR",
        "15-20" => "fly (lf) B"
      },
      "11" => "fly (lf) B?",
      "12" => "lo (ss) max"
    }
  },
  vs_rhp: {
    "1" => {
      "2" => "fly (lf) B?",
      "3" => "gb (1b) C",
      "4" => "gb (2b) A",
      "5" => "gb (3b) B",
      "6" => "fly (lf) B",
      "7" => "gb (ss) A+",
      "8" => "gb (ss) A",
      "9" => "popout (ss)",
      "10" => "foulout (c)",
      "11" => "gb (ss) B",
      "12" => "lo (ss) max"
    },
    "2" => {
      "2" => "HBP",
      "3" => "gb (3b) B",
      "4" => "fly (rf) B?",
      "5" => {
        "1-19" => "SI*",
        "20" => "lo (ss)"
      },
      "6" => "WALK",
      "7" => "fly (cf) B?",
      "8" => "gb (p) B",
      "9" => "popout (2b)",
      "10" => "WALK",
      "11" => "gb (1b) B",
      "12" => {
        "1-14" => "SI*",
        "15-20" => "lo (ss)"
      }
    },
    "3" => {
      "2" => "gb (p) B",
      "3" => "WALK",
      "4" => {
        "1-10" => "HR",
        "11-20" => "DO"
      },
      "5" => {
        "1" => "TR",
        "2-20" => "SI**"
      },
      "6" => {
        "1-9" => "DO**",
        "10-20" => "SI**"
      },
      "7" => "SINGLE (rf)",
      "8" => "SINGLE**",
      "9" => "gb (2b) C plus injury",
      "10" => "SINGLE (lf)",
      "11" => "SINGLE (lf)",
      "12" => {
        "1-16" => "HR",
        "17-20" => "fly (lf) B"
      }
    }
  }
)

Player.create!(
  team: red_sox,
  first_name: "Hanley",
  last_name: "Ramirez",
  batting_hand: "R",
  stealing: "C",
  running: "1-13",
  avg: 0.249,
  ab: 401,
  doubles: 12,
  triples: 1,
  hr: 19,
  rbi: 53,
  bb: 21,
  so: 71,
  sb: 6,
  cs: 3,
  slg: 0.426,
  obp: 0.291,
  vs_lhp: {
    "1" => {
      "2" => "fly (cf) A",
      "3" => "HBP",
      "4" => "gb (ss) A+ plus injury",
      "5" => {
        "1-16" => "HR",
        "17-20" => "fly (lf) B"
      },
      "6" => "gb (3b) A",
      "7" => "SINGLE (lf)",
      "8" => {
        "1" => "TR",
        "2-20" => "fly (cf) B"
      },
      "9" => "HOMERUN",
      "10" => "fly (cf) B?",
      "11" => "SINGLE (lf)",
      "12" => {
        "1" => "HR",
        "2-20" => "TR"
      }
    },
    "2" => {
      "2" => "gb (2b) C",
      "3" => "fly (rf) B?",
      "4" => "gb (ss) A+",
      "5" => {
        "1-5" => "SI",
        "6-20" => "lo (3b)"
      },
      "6" => "gb (2b) C",
      "7" => "strikeout",
      "8" => "gb (p) B",
      "9" => "strikeout",
      "10" => "gb (ss) A",
      "11" => "gb (2b) A",
      "12" => {
        "1-18" => "SI*",
        "19-20" => "lo (ss)"
      }
    },
    "3" => {
      "2" => "SINGLE (cf)",
      "3" => "gb (2b) A",
      "4" => "WALK",
      "5" => "strikeout",
      "6" => "gb (1b) B",
      "7" => "strikeout",
      "8" => "strikeout",
      "9" => "fly (lf) B?",
      "10" => "gb (ss) A",
      "11" => "gb (3b) A",
      "12" => "lo (ss) max"
    }
  },
  vs_rhp: {
    "1" => {
      "2" => "foulout (3b)",
      "3" => "SINGLE (lf)",
      "4" => "gb (3b) A plus injury",
      "5" => {
        "1-3" => "DO**",
        "4-20" => "SI**"
      },
      "6" => "fly (lf) B?",
      "7" => "SINGLE**",
      "8" => "SINGLE (lf)",
      "9" => {
        "1-17" => "HR",
        "18-20" => "DO"
      },
      "10" => {
        "1-16" => "HR",
        "17-20" => "fly (lf) B"
      },
      "11" => "fly (lf) B?",
      "12" => "fly (lf) B?"
    },
    "2" => {
      "2" => "WALK",
      "3" => "HBP",
      "4" => "gb (3b) B",
      "5" => "strikeout",
      "6" => "fly (cf) B?",
      "7" => "gb (ss) A+",
      "8" => "gb (ss) A",
      "9" => "gb (ss) A",
      "10" => "foulout (3b)",
      "11" => "gb (1b) C",
      "12" => "WALK"
    },
    "3" => {
      "2" => "lo (ss) max",
      "3" => "popout (ss)",
      "4" => "SINGLE (lf)",
      "5" => "gb (ss) A",
      "6" => "gb (p) B",
      "7" => "gb (3b) B",
      "8" => "strikeout",
      "9" => "gb (2b) C",
      "10" => "popout (ss)",
      "11" => "popout (ss)",
      "12" => {
        "1-14" => "SI*",
        "15-20" => "lo (ss)"
      }
    }
  }
)

Player.create!(
  team: red_sox,
  first_name: "Rusney",
  last_name: "Castillo",
  batting_hand: "R",
  stealing: "D",
  running: "1-13",
  avg: 0.253,
  ab: 273,
  doubles: 10,
  triples: 2,
  hr: 5,
  rbi: 29,
  bb: 13,
  so: 54,
  sb: 4,
  cs: 5,
  slg: 0.359,
  obp: 0.288,
  vs_lhp: {
    "1" => {
      "2" => "gb (2b) C",
      "3" => "gb (p) B",
      "4" => "gb (p) B",
      "5" => "gb (2b) A",
      "6" => "SINGLE**",
      "7" => "SINGLE**",
      "8" => "fly (cf) B?",
      "9" => "gb (ss) A",
      "10" => "gb (2b) C",
      "11" => "gb (1b) C",
      "12" => "HBP plus injury"
    },
    "2" => {
      "2" => "lo (3b) max",
      "3" => "gb (3b) A",
      "4" => "gb (3b) A",
      "5" => "fly (lf) B?",
      "6" => {
        "1-14" => "SI*",
        "15-20" => "gb (1b) B"
      },
      "7" => "gb (ss) A+",
      "8" => "strikeout",
      "9" => "fly (lf) B",
      "10" => "gb (3b) A",
      "11" => {
        "1" => "SI*",
        "2-20" => "lo (ss)"
      },
      "12" => "WALK"
    },
    "3" => {
      "2" => {
        "1-8" => "HR",
        "9-20" => "fly (lf) B"
      },
      "3" => "gb (2b) A",
      "4" => "gb (p) B",
      "5" => "strikeout",
      "6" => {
        "1-4" => "HR",
        "5-20" => "DO"
      },
      "7" => {
        "1-3" => "DO**",
        "4-20" => "SI**"
      },
      "8" => "gb (ss) A",
      "9" => "strikeout",
      "10" => {
        "1-11" => "TR",
        "12-20" => "DO"
      },
      "11" => "SINGLE (lf)",
      "12" => "gb (3b) A"
    } 
  },
  vs_rhp: {
    "1" => {
      "2" => "HBP plus injury",
      "3" => "gb (p) B",
      "4" => "gb (p) B",
      "5" => "gb (2b) C",
      "6" => {
        "1-2" => "SI*",
        "3-20" => "gb (3b) B"
      },
      "7" => "SINGLE (lf)",
      "8" => "gb (ss) A",
      "9" => "gb (ss) A",
      "10" => "gb (3b) A",
      "11" => "gb (1b) C",
      "12" => "lo (3b) max"
    },
    "2" => {
      "2" => "WALK",
      "3" => "gb (3b) A",
      "4" => "gb (ss) A",
      "5" => "strikeout",
      "6" => "strikeout",
      "7" => "fly (lf) B?",
      "8" => "fly (cf) B?",
      "9" => "gb (ss) A+",
      "10" => "strikeout",
      "11" => "gb (ss) A+",
      "12" => "WALK"
    },
    "3" => {
      "2" => "WALK",
      "3" => {
        "1" => "SI*",
        "2-20" => "lo (ss)"
      },
      "4" => "gb (p) B",
      "5" => "strikeout",
      "6" => {
        "1-2" => "TR",
        "3-20" => "SI**"
      },
      "7" => {
        "1" => "DO**",
        "2-20" => "SI**"
      },
      "8" => "gb (3b) A",
      "9" => "strikeout",
      "10" => {
        "1" => "HR",
        "2-20" => "fly (lf) B"
      },
      "11" => "SINGLE (lf)",
      "12" => "fly (rf) B?"
    }
  }
)

Player.create!(
  team: red_sox,
  first_name: "Blake",
  last_name: "Swihart",
  batting_hand: "S",
  stealing: "C",
  running: "1-12",
  avg: 0.274,
  ab: 288,
  doubles: 17,
  triples: 1,
  hr: 5,
  rbi: 31,
  bb: 18,
  so: 77,
  sb: 4,
  cs: 2,
  slg: 0.392,
  obp: 0.319,
  vs_lhp: {
    "1" => {
      "2" => {
        "1-4" => "SI*",
        "5-20" => "lo (ss)"
      },
      "3" => "gb (3b) A",
      "4" => "gb (3b) B",
      "5" => "strikeout",
      "6" => {
        "1-10" => "HR",
        "11-20" => "fly (lf) B"
      },
      "7" => "WALK",
      "8" => "gb (ss) A+",
      "9" => "WALK",
      "10" => {
        "1-13" => "DO**",
        "14-20" => "SI**"
      },
      "11" => "SINGLE (lf)",
      "12" => "gb (ss) A+"
    },
    "2" => {
      "2" => "HBP",
      "3" => "foulout (3b)",
      "4" => "gb (p) B",
      "5" => "gb (ss) A",
      "6" => {
        "1-6" => "SI*",
        "7-20" => "lo (2b)"
      },
      "7" => "SINGLE (cf)",
      "8" => "fly (cf) B",
      "9" => "gb (ss) A",
      "10" => "gb (p) B",
      "11" => "gb (2b) C",
      "12" => "lo (3b) max"
    },
    "3" => {
      "2" => "WALK",
      "3" => "gb (2b) C",
      "4" => "gb (3b) A plus injury",
      "5" => "strikeout",
      "6" => "strikeout",
      "7" => "strikeout",
      "8" => "strikeout",
      "9" => "fly (lf) B?",
      "10" => "fly (lf) B?",
      "11" => "gb (1b) C",
      "12" => "SINGLE (lf)"
    } 
  },
  vs_rhp: {
    "1" => {
      "2" => {
        "1-6" => "HR",
        "7-20" => "fly (lf) B"
      },
      "3" => "fly (lf) B?",
      "4" => "gb (3b) A",
      "5" => "strikeout",
      "6" => {
        "1-3" => "HR",
        "4-20" => "DO"
      },
      "7" => {
        "1-4" => "DO**",
        "5-20" => "SI**"
      },
      "8" => "strikeout",
      "9" => "strikeout",
      "10" => {
        "1-2" => "TR",
        "3-20" => "DO"
      },
      "11" => "SINGLE (lf)",
      "12" => "HBP"
    },
    "2" => {
      "2" => "lo (1b) max",
      "3" => "gb (1b) A",
      "4" => "gb (2b) A+",
      "5" => "gb (2b) C",
      "6" => "SINGLE**",
      "7" => "SINGLE**",
      "8" => "strikeout",
      "9" => "strikeout",
      "10" => "gb (2b) A+ plus injury",
      "11" => "gb (p) A",
      "12" => "WALK"
    },
    "3" => {
      "2" => "SINGLE (lf)",
      "3" => "gb (p) A",
      "4" => "fly (cf) B?",
      "5" => "strikeout",
      "6" => {
        "1-18" => "SI*",
        "19-20" => "gb (2b) A"
      },
      "7" => "strikeout",
      "8" => "strikeout",
      "9" => "strikeout",
      "10" => "fly (cf) B?",
      "11" => "gb (1b) C",
      "12" => {
        "1-5" => "SI*",
        "6-20" => "lo (2b)"
      }
    }
  }
)

Player.create!(
  team: red_sox,
  first_name: "Pablo",
  last_name: "Sandoval",
  batting_hand: "S",
  stealing: "E",
  running: "1-10",
  avg: 0.245,
  ab: 470,
  doubles: 25,
  triples: 1,
  hr: 10,
  rbi: 47,
  bb: 25,
  so: 73,
  sb: 0,
  cs: 0,
  slg: 0.366,
  obp: 0.292,
  vs_lhp: {
    "1" => {
      "2" => "DOUBLE (rf)",
      "3" => "SINGLE (cf)",
      "4" => {
        "1-2" => "DO**",
        "3-20" => "SI**"
      },
      "5" => "SINGLE (lf)",
      "6" => {
        "1-9" => "SI*",
        "10-20" => "lo (3b)"
      },
      "7" => "fly (cf) B?",
      "8" => "strikeout",
      "9" => "gb (ss) A",
      "10" => "popout (ss)",
      "11" => "HBP",
      "12" => {
        "1" => "SI*",
        "2-20" => "lo (ss)"
      }
    },
    "2" => {
      "2" => "lo (3b) max",
      "3" => "gb (1b) C",
      "4" => "gb (ss) A",
      "5" => "strikeout",
      "6" => "strikeout",
      "7" => "gb (ss) A+",
      "8" => "fly (lf) B?",
      "9" => "fly (rf) B?",
      "10" => "gb (2b) C",
      "11" => "gb (3b) B",
      "12" => "HBP plus injury"
    },
    "3" => {
      "2" => "gb (2b) C",
      "3" => "foulout (c)",
      "4" => "gb (3b) B",
      "5" => "strikeout",
      "6" => "gb (ss) A",
      "7" => "gb (3b) B",
      "8" => "gb (p) B",
      "9" => "gb (ss) A",
      "10" => "popout (ss)",
      "11" => "foulout (3b)",
      "12" => "gb (ss) B"
    }
  },
  vs_rhp: {
    "1" => {
      "2" => "HOMERUN",
      "3" => {
        "1-11" => "HR",
        "12-20" => "fly (lf) B"
      },
      "4" => {
        "1-8" => "HR",
        "9-20" => "DO"
      },
      "5" => "DOUBLE (lf)",
      "6" => {
        "1-4" => "DO**",
        "5-20" => "SI**"
      },
      "7" => "strikeout",
      "8" => "gb (ss) A+",
      "9" => "popout (ss)",
      "10" => "gb (1b) B",
      "11" => "fly (lf) B?",
      "12" => {
        "1-3" => "SI*",
        "4-20" => "lo (2b)"
      }
    },
    "2" => {
      "2" => "WALK",
      "3" => "SINGLE (lf)",
      "4" => "SINGLE (cf)",
      "5" => "gb (p) B",
      "6" => "gb (ss) A",
      "7" => {
        "1-13" => "SI*",
        "14-20" => "lo (2b)"
      },
      "8" => "gb (ss) A",
      "9" => "gb (p) A",
      "10" => "SINGLE**",
      "11" => "WALK",
      "12" => "lo (1b) max"
    },
    "3" => {
      "2" => "HBP plus injury",
      "3" => "HBP",
      "4" => "gb (2b) A",
      "5" => "fly (lf) B?",
      "6" => "fly (cf) B?",
      "7" => "gb (2b) C",
      "8" => "gb (3b) B",
      "9" => "foulout (c)",
      "10" => "gb (2b) A",
      "11" => "fly (rf) B?",
      "12" => "gb (ss) A+"
    }
  }
)

Player.create!(
  team: red_sox,
  first_name: "Travis",
  last_name: "Shaw",
  batting_hand: "L",
  stealing: "E",
  running: "1-11",
  avg: 0.274,
  ab: 226,
  doubles: 10,
  triples: 0,
  hr: 13,
  rbi: 36,
  bb: 18,
  so: 57,
  sb: 0,
  cs: 1,
  slg: 0.491,
  obp: 0.331,
  vs_lhp: {
    "1" => {
      "2" => "lo (2b) max",
      "3" => "gb (1b) C",
      "4" => "fly (lf) B?",
      "5" => "SINGLE**",
      "6" => {
        "1-14" => "SI*",
        "15-20" => "lo (2b)"
      },
      "7" => "gb (ss) B+",
      "8" => "SINGLE (lf)",
      "9" => "strikeout",
      "10" => "gb (2b) C",
      "11" => "gb (p) B",
      "12" => "HBP plus injury"
    },
    "2" => {
      "2" => "HBP",
      "3" => "gb (p) B",
      "4" => "foulout (3b)",
      "5" => "strikeout",
      "6" => "popout (ss)",
      "7" => "strikeout",
      "8" => "strikeout",
      "9" => "strikeout",
      "10" => "popout (ss)",
      "11" => "popout (2b)",
      "12" => {
        "1-13" => "SI*",
        "14-20" => "lo (2b)"
      }
    },
    "3" => {
      "2" => "gb (2b) C",
      "3" => "SINGLE (lf)",
      "4" => "SINGLE**",
      "5" => "DOUBLE (lf)",
      "6" => "fly (lf) B?",
      "7" => "fly (cf) B?",
      "8" => "HOMERUN",
      "9" => {
        "1-15" => "HR",
        "16-20" => "fly (lf) B"
      },
      "10" => {
        "1-15" => "HR",
        "16-20" => "fly (lf) B"
      },
      "11" => {
        "1-2" => "DO**",
        "3-20" => "SI**"
      },
      "12" => "SINGLE (cf)"
    }
  },
  vs_rhp: {
    "1" => {
      "2" => {
        "1-8" => "SI*",
        "9-20" => "lo (2b)"
      },
      "3" => "fly (cf) B?",
      "4" => "strikeout",
      "5" => "SINGLE (lf)",
      "6" => {
        "1-4" => "SI*",
        "5-20" => "lo (2b)"
      },
      "7" => "gb (2b) B+",
      "8" => "SINGLE (lf)",
      "9" => "strikeout",
      "10" => "strikeout",
      "11" => "fly (rf) B?",
      "12" => "lo (2b) max plus injury"
    },
    "2" => {
      "2" => "gb (p) B",
      "3" => "gb (1b) C",
      "4" => "gb (2b) C",
      "5" => "strikeout",
      "6" => "popout (ss)",
      "7" => "WALK",
      "8" => "strikeout",
      "9" => "strikeout",
      "10" => "foulout (c)",
      "11" => "HBP",
      "12" => "gb (1b) C"
    },
    "3" => {
      "2" => "fly (cf) A",
      "3" => "SINGLE (cf)",
      "4" => "WALK",
      "5" => {
        "1-13" => "DO",
        "14-20" => "fly (cf) B"
      },
      "6" => "fly (lf) B?",
      "7" => "strikeout",
      "8" => "HOMERUN",
      "9" => {
        "1-3" => "HR",
        "4-20" => "fly (lf) B" 
      },
      "10" => {
        "1-15" => "HR",
        "16-20" => "fly (lf) B"
      },
      "11" => "SINGLE (lf)",
      "12" => "WALK"
    }
  }
)
