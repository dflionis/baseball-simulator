puts "Creating Yankees players..."
yankees = Team.find_by(name: "Yankees")

Player.create!(
  team: yankees,
  first_name: "Didi",
  last_name: "Gregorius",
  batting_hand: "L",
  stealing: "D",
  running: "1-14",
  avg: 0.265,
  ab: 525,
  doubles: 24,
  triples: 2,
  hr: 9,
  rbi: 56,
  bb: 33,
  so: 85,
  sb: 5,
  cs: 3,
  slg: 0.370,
  obp: 0.318,
  vs_lhp: {
    "1" => {
      "2" => "lo (2b) max",
      "3" => "gb (ss) A",
      "4" => "foulout (c)",
      "5" => "gb (p) B",
      "6" => "fly (cf) B?",
      "7" => "strikeout",
      "8" => "gb (ss) A+",
      "9" => "popout (ss)",
      "10" => "popout (ss)",
      "11" => "gb (1b) C",
      "12" => "HBP plus injury"
    },
    "2" => {
      "2" => {
        "1-12" => "SI*",
        "13-20" => "lo (2b)"
      },
      "3" => "gb (2b) B",
      "4" => "fly (lf) B?",
      "5" => "gb (2b) C",
      "6" => "fly (rf) B?",
      "7" => "strikeout",
      "8" => "gb (ss) B",
      "9" => "lineout (3b)",
      "10" => "HBP",
      "11" => "gb (3b) B",
      "12" => "fly (cf) B?"
    },
    "3" => {
      "2" => "gb (ss) A+",
      "3" => "SINGLE (rf)",
      "4" => {
        "1-9" => "HR",
        "10-20" => "DO"
      },
      "5" => {
        "1-4" => "TR",
        "5-20" => "SI**"
      },
      "6" => "SINGLE (lf)",
      "7" => {
        "1-14" => "SI*",
        "15-20" => "lo (2b)"
      },
      "8" => "WALK",
      "9" => "gb (p) B",
      "10" => {
        "1" => "DO**",
        "2-20" => "SI**"
      },
      "11" => "SINGLE (cf)",
      "12" => "WALK"
    }
  },
  vs_rhp: {
    "1" => {
      "2" => "HBP plus injury",
      "3" => "gb (ss) A",
      "4" => "gb (2b) B",
      "5" => "fly (rf) B?",
      "6" => "gb (ss) A+",
      "7" => "fly (cf) B?",
      "8" => "gb (p) B",
      "9" => "gb (2b) C",
      "10" => "foulout (1b)",
      "11" => "gb (1b) C",
      "12" => "gb (ss) A+"
    },
    "2" => {
      "2" => "gb (p) B",
      "3" => "popout (ss)",
      "4" => "gb (ss) B",
      "5" => "WALK",
      "6" => "fly (lf) B",
      "7" => "strikeout",
      "8" => "popout (ss)",
      "9" => "gb (3b) B",
      "10" => "HBP",
      "11" => "lineout (2b)",
      "12" => "foulout (1b)"
    },
    "3" => {
      "2" => {
        "1-12" => "SI*",
        "13-20" => "lo (2b)"
      },
      "3" => "SINGLE (cf)",
      "4" => {
        "1-8" => "HR",
        "9-20" => "DO"
      },
      "5" => {
        "1-13" => "DO**",
        "14-20" => "SI**"
      },
      "6" => "SINGLE (rf)",
      "7" => "SINGLE**",
      "8" => "SINGLE**",
      "9" => "strikeout",
      "10" => {
        "1-7" => "SI*",
        "8-20" => "lo (2b)"
      },
      "11" => "SINGLE (cf)",
      "12" => "lo (2b) max"
    }
  }
)

Player.create!(
  team: yankees,
  first_name: "Chase",
  last_name: "Headley",
  batting_hand: "S",
  stealing: "E",
  running: "1-13",
  avg: 0.259,
  ab: 580,
  doubles: 29,
  triples: 1,
  hr: 11,
  rbi: 62,
  bb: 51,
  so: 135,
  sb: 0,
  cs: 2,
  slg: 0.369,
  obp: 0.324,
  vs_lhp: {
    "1" => {
      "2" => "HBP plus injury",
      "3" => "HBP",
      "4" => "fly (lf) B?",
      "5" => {
        "1-3" => "SI*",
        "4-20" => "lo (3b)"
      },
      "6" => "WALK",
      "7" => "gb (3b) A",
      "8" => "SINGLE**",
      "9" => "strikeout",
      "10" => "fly (rf) B?",
      "11" => "gb (p) A",
      "12" => "gb (2b) C"
    },
    "2" => {
      "2" => {
        "1-7" => "SI*",
        "8-20" => "lo (ss)"
      },
      "3" => "gb (1b) C",
      "4" => "gb (p) A",
      "5" => "strikeout",
      "6" => "fly (cf) B?",
      "7" => "gb (ss) A+",
      "8" => "strikeout",
      "9" => "fly (lf) B?",
      "10" => "gb (2b) C",
      "11" => "foulout (3b)",
      "12" => "foulout (3b)"
    },
    "3" => {
      "2" => "popout (ss)",
      "3" => "WALK",
      "4" => "strikeout",
      "5" => "SINGLE (lf)",
      "6" => {
        "1" => "DO**",
        "2-20" => "SI**"
      },
      "7" => "gb (ss) A",
      "8" => {
        "1-2" => "TR",
        "3-20" => "SI**"
      },
      "9" => {
        "1" => "HR",
        "2-20" => "DO"
      },
      "10" => "DOUBLE (cf)",
      "11" => "SINGLE (cf)",
      "12" => "lo (ss) max"
    }
  },
  vs_rhp: {
    "1" => {
      "2" => "strikeout",
      "3" => "HBP",
      "4" => "gb (p) A",
      "5" => "SINGLE (lf)",
      "6" => "SINGLE**",
      "7" => "gb (ss) A",
      "8" => "SINGLE (lf)",
      "9" => "strikeout",
      "10" => "gb (1b) A",
      "11" => "fly (rf) B?",
      "12" => "lo (2b) max"
    },
    "2" => {
      "2" => "HBP plus injury",
      "3" => "gb (p) A",
      "4" => "gb (3b) A",
      "5" => "strikeout",
      "6" => "strikeout",
      "7" => "fly (cf) B?",
      "8" => "strikeout",
      "9" => "strikeout",
      "10" => "gb (2b) C",
      "11" => "gb (1b) C",
      "12" => "gb (2b) C"
    },
    "3" => {
      "2" => "foulout (c)",
      "3" => "WALK",
      "4" => "fly (lf) B?",
      "5" => "strikeout",
      "6" => "WALK",
      "7" => "gb (2b) A+",
      "8" => {
        "1-4" => "HR",
        "5-20" => "fly (lf) B"
      },
      "9" => {
        "1-14" => "DO**",
        "15-20" => "SI**"
      },
      "10" => "WALK",
      "11" => "SINGLE (lf)",
      "12" => {
        "1-14" => "SI*",
        "15-20" => "lo (2b)"
      }
    }
  }
)

Player.create!(
  team: yankees,
  first_name: "Carlos",
  last_name: "Beltran",
  batting_hand: "S",
  stealing: "E",
  running: "1-10",
  avg: 0.276,
  ab: 478,
  doubles: 34,
  triples: 1,
  hr: 19,
  rbi: 67,
  bb: 45,
  so: 85,
  sb: 0,
  cs: 0,
  slg: 0.471,
  obp: 0.337,
  vs_lhp: {
    "1" => {
      "2" => "HBP",
      "3" => "gb (1b) C",
      "4" => "popout (ss)",
      "5" => "SINGLE (rf)",
      "6" => {
        "1-7" => "SI*",
        "8-20" => "lo (3b)"
      },
      "7" => "gb (ss) A+",
      "8" => "fly (cf) B?",
      "9" => "strikeout",
      "10" => "popout (ss)",
      "11" => "foulout (c)",
      "12" => {
        "1-18" => "SI*",
        "19-20" => "lo (ss)"
      }
    },
    "2" => {
      "2" => "foulout (3b)",
      "3" => "SINGLE (cf)",
      "4" => {
        "1-15" => "HR",
        "16-20" => "TR"
      },
      "5" => "DOUBLE (lf)",
      "6" => {
        "1-7" => "DO**",
        "8-20" => "SI**"
      },
      "7" => "fly (lf) B?",
      "8" => "strikeout",
      "9" => "strikeout",
      "10" => {
        "1" => "TR",
        "2-20" => "DO"
      },
      "11" => {
        "1-19" => "HR",
        "20" => "fly (lf) B"
      },
      "12" => "fly (lf) B"
    },
    "3" => {
      "2" => "WALK",
      "3" => "WALK",
      "4" => "fly (rf) B?",
      "5" => "gb (2b) C",
      "6" => "gb (p) A",
      "7" => "gb (3b) A",
      "8" => "gb (ss) A",
      "9" => "popout (2b)",
      "10" => "popout (ss)",
      "11" => "strikeout plus injury",
      "12" => "lo (3b) max"
    }
  },
  vs_rhp: {
    "1" => {
      "2" => "HBP",
      "3" => "gb (1b) C",
      "4" => "popout (ss)",
      "5" => "strikeout",
      "6" => "WALK",
      "7" => "fly (cf) B?",
      "8" => "WALK",
      "9" => "strikeout",
      "10" => "popout (ss)",
      "11" => "foulout (c)",
      "12" => {
        "1-3" => "SI*",
        "4-20" => "lo (2b)"
      }
    },
    "2" => {
      "2" => "foulout (1b)",
      "3" => "SINGLE (lf)",
      "4" => {
        "1-18" => "HR",
        "19-20" => "DO"
      },
      "5" => "DOUBLE (rf)",
      "6" => {
        "1-15" => "DO**",
        "16-20" => "SI**"
      },
      "7" => "SINGLE**",
      "8" => {
        "1-15" => "SI*",
        "16-20" => "lo (2b)"
      },
      "9" => "fly (lf) B?",
      "10" => {
        "1-17" => "HR",
        "18-20" => "fly (lf) B"
      },
      "11" => "SINGLE (cf)",
      "12" => "fly (lf) B?"
    },
    "3" => {
      "2" => "SINGLE (cf)",
      "3" => "WALK",
      "4" => "gb (3b) A",
      "5" => "fly (rf) B?",
      "6" => "strikeout",
      "7" => "gb (ss) A+",
      "8" => "gb (p) A",
      "9" => "gb (ss) A",
      "10" => "gb (2b) C",
      "11" => "gb (2b) A plus injury",
      "12" => "lo (2b) max"
    }
  }
)

Player.create!(
  team: yankees,
  first_name: "Brian",
  last_name: "McCann",
  batting_hand: "L",
  stealing: "E",
  running: "1-8",
  avg: 0.232,
  ab: 465,
  doubles: 15,
  triples: 1,
  hr: 26,
  rbi: 94,
  bb: 52,
  so: 97,
  sb: 0,
  cs: 0,
  slg: 0.437,
  obp: 0.320,
  vs_lhp: {
    "1" => {
      "2" => "gb (1b) c",
      "3" => "WALK",
      "4" => "fly (lf) B?",
      "5" => "strikeout",
      "6" => "gb (2b) C",
      "7" => "strikeout",
      "8" => "strikeout",
      "9" => "strikeout",
      "10" => "fly (cf) B?",
      "11" => "fly (rf) B?",
      "12" => "fly (rf) B?"
    },
    "2" => {
      "2" => {
        "1-5" => "SI*",
        "6-20" => "lo (2b)"
      },
      "3" => "SINGLE (cf)",
      "4" => "gb (2b) A+",
      "5" => {
        "1-19" => "HR",
        "20" => "fly (lf) B"
      },
      "6" => "lineout (1b)",
      "7" => "WALK",
      "8" => "WALK",
      "9" => {
        "1-18" => "HR",
        "19-20" => "fly (lf) B"
      },
      "10" => {
        "1" => "DO**",
        "2-20" => "SI**"
      },
      "11" => "fly (lf) B?",
      "12" => "fly (cf) A"
    },
    "3" => {
      "2" => "HBP plus injury",
      "3" => "gb (p) A",
      "4" => "gb (2b) A+",
      "5" => "SINGLE (cf)",
      "6" => "popout (ss)",
      "7" => {
        "1-10" => "SI*",
        "11-20" => "lo (1b)"
      },
      "8" => "popout (ss)",
      "9" => "HBP",
      "10" => "fly (cf) B?",
      "11" => "gb (p) A",
      "12" => "lo (2b) max"
    }
  },
  vs_rhp: {
    "1" => {
      "2" => "lo (2b) max",
      "3" => "fly (rf) B?",
      "4" => "HBP",
      "5" => "strikeout",
      "6" => "popout (ss)",
      "7" => "gb (ss) A+",
      "8" => "strikeout",
      "9" => "strikeout",
      "10" => "gb (1b) C",
      "11" => "fly (rf) B?",
      "12" => "WALK"
    },
    "2" => {
      "2" => {
        "1-5" => "SI*",
        "6-20" => "lo (2b)"
      },
      "3" => "SINGLE (lf)",
      "4" => "foulout (1b)",
      "5" => {
        "1-19" => "HR",
        "20" => "fly (lf) B"
      },
      "6" => "lineout (3b)",
      "7" => "WALK", 
      "8" => "WALK", 
      "9" => "HOMERUN",
      "10" => {
        "1-6" => "DO**",
        "7-20" => "SI**"
      },
      "11" => "fly (lf) B?",
      "12" => "fly (cf) A"
    },
    "3" => {
      "2" => "HBP",
      "3" => "fly (lf) B?",
      "4" => "gb (2b) C",
      "5" => {
        "1-19" => "SI*",
        "20" => "gb (3b) B"
      },
      "6" => "popout (2b)",
      "7" => "fly (cf) B?",
      "8" => "popout (ss)",
      "9" => "strikeout",
      "10" => "gb (p) A",
      "11" => "gb (ss) A",
      "12" => "HBP plus injury"
    }
  }
)

Player.create!(
  team: yankees,
  first_name: "Brett",
  last_name: "Gardner",
  batting_hand: "L",
  stealing: "A",
  running: "1-17",
  avg: 0.259,
  ab: 571,
  doubles: 26,
  triples: 3,
  hr: 16,
  rbi: 66,
  bb: 68,
  so: 135,
  sb: 20,
  cs: 5,
  slg: 0.399,
  obp: 0.343,
  vs_lhp: {
    "1" => {
      "2" => {
        "1-17" => "SI*",
        "18-20" => "lo (2b)"
      },
      "3" => "foulout (c)",
      "4" => "gb (p) A",
      "5" => "strikeout",
      "6" => "fly (cf) B?",
      "7" => "WALK",
      "8" => "strikeout",
      "9" => "strikeout",
      "10" => "gb (ss) B",
      "11" => "foulout (3b)",
      "12" => "gb (p) A"
    },
    "2" => {
      "2" => "gb (ss) A",
      "3" => "gb (1b) C",
      "4" => "fly (lf) B?",
      "5" => "SINGLE**",
      "6" => "SINGLE**",
      "7" => "strikeout",
      "8" => {
        "1-4" => "HR",
        "5-20" => "DO"
      },
      "9" => "DOUBLE (lf)",
      "10" => {
        "1-4" => "DO**",
        "5-20" => "SI**"
      },
      "11" => "SINGLE (lf)",
      "12" => "lo (2b) max"
    },
    "3" => {
      "2" => "HBP plus injury",
      "3" => "gb (2b) C",
      "4" => "gb (2b) A+",
      "5" => "WALK",
      "6" => "WALK",
      "7" => "fly (lf) B?",
      "8" => {
        "1-16" => "SI*",
        "17-20" => "lo (2b)"
      },
      "9" => "strikeout",
      "10" => "gb (2b) A+",
      "11" => "gb (2b) C",
      "12" => "HBP"
    }
  },
  vs_rhp: {
    "1" => {
      "2" => "gb (2b) C",
      "3" => "gb (1b) C",
      "4" => "gb (p) B",
      "5" => "strikeout",
      "6" => "strikeout",
      "7" => "strikeout",
      "8" => "WALK",
      "9" => "strikeout",
      "10" => "popout (ss)",
      "11" => "foulout (c)",
      "12" => {
        "1-17" => "SI*",
        "18-20" => "lo (2b)"
      }
    },
    "2" => {
      "2" => "gb (1b) B",
      "3" => "SINGLE (lf)",
      "4" => "fly (lf) B?",
      "5" => "SINGLE (lf)",
      "6" => "SINGLE (lf)",
      "7" => "fly (cf) B?",
      "8" => {
        "1-8" => "HR",
        "9-20" => "fly (lf) B"
      },
      "9" => {
        "1-3" => "TR",
        "4-20" => "SI**"
      },
      "10" => {
        "1-7" => "DO**",
        "8-20" => "SI**"
      },
      "11" => {
        "1-13" => "HR",
        "14-20" => "fly (lf) B"
      },
      "12" => "lo (2b) max"
    },
    "3" => {
      "2" => "HBP plus injury",
      "3" => "fly (rf) B?",
      "4" => "gb (ss) A",
      "5" => "WALK", 
      "6" => "WALK", 
      "7" => "gb (2b) A+",
      "8" => {
        "1-3" => "SI*",
        "4-20" => "lo (2b)"
      },
      "9" => "strikeout",
      "10" => "gb (2b) C",
      "11" => "gb (ss) A",
      "12" => "HBP"
    }
  }
)

Player.create!(
  team: yankees,
  first_name: "Stephen",
  last_name: "Drew",
  batting_hand: "L",
  stealing: "E",
  running: "1-12",
  avg: 0.201,
  ab: 383,
  doubles: 16,
  triples: 1,
  hr: 17,
  rbi: 44,
  bb: 37,
  so: 71,
  sb: 0,
  cs: 2,
  slg: 0.381,
  obp: 0.271,
  vs_lhp: {
    "1" => {
      "2" => "HBP plus injury",
      "3" => "gb (1b) A",
      "4" => "popout (2b)",
      "5" => "strikeout",
      "6" => "gb (ss) A",
      "7" => "fly (cf) B?",
      "8" => "popout (ss)",
      "9" => "gb (2b) A+",
      "10" => "popout (2b)",
      "11" => "foulout (3b)",
      "12" => "fly (lf) B?"
    },
    "2" => {
      "2" => "HOMERUN",
      "3" => {
        "1-19" => "HR",
        "20" => "fly (lf) B",
      },
      "4" => {
        "1-11" => "HR",
        "12-20" => "DO"  
      },
      "5" => "DOUBLE (rf)",
      "6" => {
        "1-6" => "DO",
        "7-20" => "fly (lf) B"
      },
      "7" => {
        "1-2" => "SI*",
        "3-20" => "lo (1b)"
      },
      "8" => "WALK",
      "9" => "gb (p) A",
      "10" => "gb (1b) C",
      "11" => "SINGLE (cf)",
      "12" => "fly (lf) B?"
    },
    "3" => {
      "2" => {
        "1-16" => "SI*",
        "17-20" => "lo (2b)"
      },
      "3" => "WALK",
      "4" => "gb (2b) C",
      "5" => "strikeout",
      "6" => "strikeout",
      "7" => "strikeout",
      "8" => "strikeout",
      "9" => "fly (rf) B?",
      "10" => "foulout (1b)",
      "11" => "gb (2b) A+",
      "12" => "lo (2b) max"
    }
  },
  vs_rhp: {
    "1" => {
      "2" => "HBP plus injury",
      "3" => "gb (2b) A+",
      "4" => "lineout (1b)",
      "5" => "fly (cf) B?",
      "6" => "popout (2b)",
      "7" => "strikeout",
      "8" => "popout (ss)",
      "9" => "gb (p) A",
      "10" => "lineout (3b)",
      "11" => "gb (1b) C",
      "12" => {
        "1" => "SI*",
        "2-20" => "lo (2b)"
      }
    },
    "2" => {
      "2" => "HOMERUN",
      "3" => "HOMERUN",
      "4" => {
        "1-18" => "HR",
        "19-20" => "DO"
      },
      "5" => {
        "1-7" => "DO",
        "8-20" => "fly (lf) B"
      },
      "6" => {
        "1-5" => "SI*",
        "6-20" => "lo (1b)"
      },
      "7" => "WALK",
      "8" => "WALK",
      "9" => "gb (2b) C",
      "10" => "lineout (3b)",
      "11" => "SINGLE (cf)",
      "12" => {
        "1-10" => "HR",
        "11-20" => "fly (lf) B"
      }
    },
    "3" => {
      "2" => "fly (lf) B?",
      "3" => "SINGLE (lf)",
      "4" => "foulout (c)",
      "5" => "fly (rf) B?",
      "6" => "gb (ss) A",
      "7" => "strikeout",
      "8" => "popout (2b)",
      "9" => "gb (2b) A+",
      "10" => "popout (ss)",
      "11" => "fly (cf) B?",
      "12" => "lo (2b) max"
    }
  }
)

Player.create!(
  team: yankees,
  first_name: "Mark",
  last_name: "Teixeira",
  batting_hand: "S",
  stealing: "E",
  running: "1-8",
  avg: 0.255,
  ab: 392,
  doubles: 22,
  triples: 0,
  hr: 31,
  rbi: 79,
  bb: 59,
  so: 85,
  sb: 2,
  cs: 0,
  slg: 0.548,
  obp: 0.357,
  vs_lhp: {
    "1" => {
      "2" => "WALK",
      "3" => "gb (p) B",
      "4" => "HBP plus injury",
      "5" => "WALK",
      "6" => "WALK",
      "7" => "fly (cf) B?",
      "8" => "gb (ss) A+",
      "9" => "strikeout",
      "10" => "strikeout",
      "11" => "gb (1b) C",
      "12" => "WALK"
    },
    "2" => {
      "2" => "fly (rf) B?",
      "3" => "SINGLE (rf)",
      "4" => "foulout (c)",
      "5" => "WALK",
      "6" => {
        "1-13" => "HR",
        "14-20" => "fly (rf) B"
      },
      "7" => {
        "1-5" => "DO",
        "6-20" => "fly (cf) B"
      },
      "8" => "popout (1b)",
      "9" => {
        "1-9" => "SI*",
        "10-20" => "lo (ss)"
      },
      "10" => {
        "1-16" => "HR",
        "17-20" => "fly (rf) B"
      },
      "11" => "SINGLE (rf)",
      "12" => "gb (ss) A+"
    },
    "3" => {
      "2" => {
        "1-14" => "SI*",
        "15-20" => "lo (ss)"
      },
      "3" => "gb (ss) B",
      "4" => "gb (3b) B",
      "5" => "gb (2b) C",
      "6" => "WALK",
      "7" => "WALK",
      "8" => "popout (3b)",
      "9" => "gb (ss) A",
      "10" => "gb (2b) B",
      "11" => "gb (p) B",
      "12" => "lo (2b) max"
    }
  },
  vs_rhp: {
    "1" => {
      "2" => {
        "1-16" => "SI*",
        "17-20" => "lo (2b)"
      },
      "3" => "gb (p) A",
      "4" => "HBP plus injury",
      "5" => "strikeout",
      "6" => "WALK",
      "7" => "fly (cf) B?",
      "8" => "strikeout",
      "9" => "strikeout",
      "10" => "strikeout",
      "11" => "WALK",
      "12" => "fly (lf) B?"
    },
    "2" => {
      "2" => "HOMERUN",
      "3" => "SINGLE (lf)",
      "4" => "gb (ss) A",
      "5" => {
        "1-9" => "DO",
        "10-20" => "fly (cf) B"
      },
      "6" => "HOMERUN",
      "7" => {
        "1-5" => "HR",
        "6-20" => "DO"
      },
      "8" => "popout (2b)",
      "9" => "HOMERUN",
      "10" => "HOMERUN",
      "11" => "fly (lf) B?",
      "12" => "fly (cf) A"
    },
    "3" => {
      "2" => "lo (2b) max",
      "3" => "gb (1b) C",
      "4" => "gb (2b) A+",
      "5" => "gb (2b) C",
      "6" => "WALK",
      "7" => {
        "1-5" => "SI*",
        "6-20" => "gb (ss)"
      },
      "8" => "strikeout",
      "9" => "strikeout",
      "10" => "gb (2b) A+",
      "11" => "gb (p) A",
      "12" => "WALK"
    }
  }
)

Player.create!(
  team: yankees,
  first_name: "Alex",
  last_name: "Rodriguez",
  batting_hand: "R",
  stealing: "D",
  running: "1-9",
  avg: 0.250,
  ab: 523,
  doubles: 22,
  triples: 1,
  hr: 33,
  rbi: 86,
  bb: 84,
  so: 145,
  sb: 4,
  cs: 0,
  slg: 0.486,
  obp: 0.356,
  vs_lhp: {
    "1" => {
      "2" => "fly (cf) A",
      "3" => "SINGLE (lf)",
      "4" => "strikeout",
      "5" => {
        "1-4" => "HR",
        "5-20" => "DO"
      },
      "6" => "strikeout",
      "7" => "gb (p) A",
      "8" => {
        "1-12" => "HR",
        "13-20" => "fly (lf) B"
      },
      "9" => "HOMERUN",
      "10" => "gb (ss) A",
      "11" => {
        "1-5" => "TR",
        "6-20" => "fly (lf) B" 
      },
      "12" => {
        "1-14" => "HR",
        "15-20" => "fly (lf) B"
      }
    },
    "2" => {
      "2" => "SINGLE (lf)",
      "3" => "WALK",
      "4" => "gb (2b) A+",
      "5" => {
        "1-16" => "SI*",
        "17-20" => "gb (ss) A"
      },
      "6" => "strikeout",
      "7" => "WALK",
      "8" => "strikeout",
      "9" => "strikeout",
      "10" => "gb (2b) A+",
      "11" => "gb (2b) C",
      "12" => "lo (3b) max"
    },
    "3" => {
      "2" => "HBP plus injury",
      "3" => {
        "1-6" => "SI*",
        "7-20" => "lo (ss)"
      },
      "4" => "WALK",
      "5" => "strikeout",
      "6" => "strikeout",
      "7" => "WALK",
      "8" => "WALK",
      "9" => "strikeout",
      "10" => {
        "1-18" => "DO",
        "19-20" => "fly (cf) B"
      },
      "11" => "gb (1b) C",
      "12" => "HBP"
    }
  },
  vs_rhp: {
    "1" => {
      "2" => "gb (2b) C",
      "3" => "SINGLE (lf)",
      "4" => "strikeout",
      "5" => "gb (ss) A",
      "6" => "strikeout",
      "7" => {
        "1-10" => "SI*",
        "11-20" => "gb (1b) A"
      },
      "8" => {
        "1-4" => "DO**",
        "5-20" => "SI**"
      },
      "9" => "HOMERUN",
      "10" => "HOMERUN",
      "11" => "fly (lf) B?",
      "12" => {
        "1-14" => "HR",
        "15-20" => "fly (lf) B"
      }
    },
    "2" => {
      "2" => "SINGLE (lf)",
      "3" => {
        "1-6" => "SI*",
        "7-20" => "lo (ss)"
      },
      "4" => "gb (ss) A+",
      "5" => "WALK",
      "6" => "strikeout",
      "7" => "WALK",
      "8" => "fly (cf) B?",
      "9" => "strikeout",
      "10" => "gb (ss) A+",
      "11" => "HBP",
      "12" => "WALK"
    },
    "3" => {
      "2" => "lo (3b) max plus injury",
      "3" => {
        "1-6" => "HR",
        "7-20" => "fly (lf) B"
      },
      "4" => "WALK",
      "5" => "strikeout",
      "6" => "gb (2b) C",
      "7" => "WALK",
      "8" => "strikeout",
      "9" => "gb (p) A",
      "10" => "gb (3b) A",
      "11" => "gb (3b) A",
      "12" => "fly (cf) A"
    }
  }
)

Player.create!(
  team: yankees,
  first_name: "Jacoby",
  last_name: "Ellsbury",
  batting_hand: "L",
  stealing: "A",
  running: "1-17",
  avg: 0.257,
  ab: 452,
  doubles: 15,
  triples: 2,
  hr: 7,
  rbi: 33,
  bb: 35,
  so: 86,
  sb: 21,
  cs: 9,
  slg: 0.345,
  obp: 0.318,
  vs_lhp: {
    "1" => {
      "2" => "WALK",
      "3" => "WALK",
      "4" => "popout (2b)",
      "5" => "SINGLE**",
      "6" => {
        "1" => "HR",
        "2-20" => "fly (lf) B"
      },
      "7" => "SINGLE (lf)",
      "8" => "popout (3b)",
      "9" => "SINGLE (lf)",
      "10" => {
        "1-9" => "DO**",
        "10-20" => "SI**"
      },
      "11" => "SINGLE (lf)",
      "12" => "gb (2b) C"
    },
    "2" => {
      "2" => "gb (1b) A",
      "3" => "gb (1b) B",
      "4" => "foulout (c)",
      "5" => "strikeout",
      "6" => "WALK",
      "7" => {
        "1-16" => "SI*",
        "17-20" => "lo (2b)"
      },
      "8" => "gb (ss) A",
      "9" => "strikeout",
      "10" => "gb (2b) C",
      "11" => "gb (p) B",
      "12" => "gb (2b) A+"
    },
    "3" => {
      "2" => {
        "1-6" => "SI*",
        "7-20" => "lo (2b)"
      },
      "3" => "gb (p) B",
      "4" => "fly (lf) B?",
      "5" => "strikeout",
      "6" => "strikeout",
      "7" => "fly (cf) B?",
      "8" => "gb (2b) A+",
      "9" => "strikeout",
      "10" => "HBP plus injury",
      "11" => "gb (1b) C",
      "12" => "lo (1b) max"
    }
  },
  vs_rhp: {
    "1" => {
      "2" => "WALK",
      "3" => "fly (rf) B?",
      "4" => "popout (2b)",
      "5" => "SINGLE (lf)",
      "6" => {
        "1-2" => "HR",
        "3-20" => "fly (lf) B"
      },
      "7" => {
        "1-4" => "DO**",
        "5-20" => "SI**"
      },
      "8" => "lineout (ss)",
      "9" => "SINGLE (lf)",
      "10" => {
        "1-5" => "TR",
        "6-20" => "SI**"
      },
      "11" => "SINGLE (lf)",
      "12" => "gb (p) B"
    },
    "2" => {
      "2" => "gb (p) A",
      "3" => "foulout (3b)",
      "4" => "gb (1b) B",
      "5" => "gb (2b) C",
      "6" => "WALK",
      "7" => {
        "1-19" => "SI*",
        "20" => "lo (2b)"
      },
      "8" => "popout (2b)",
      "9" => "strikeout",
      "10" => "gb (p) B",
      "11" => "foulout (3b)",
      "12" => {
        "1-6" => "SI*",
        "7-20" => "lo (2b)"
      }
    },
    "3" => {
      "2" => "gb (2b) A+",
      "3" => "gb (3b) B",
      "4" => "fly (lf) B?",
      "5" => "strikeout",
      "6" => "gb (2b) A+",
      "7" => "fly (cf) B?",
      "8" => "gb (ss) A",
      "9" => "strikeout",
      "10" => "HBP plus injury",
      "11" => "gb (1b) C",
      "12" => "lo (1b) max"
    }
  }
)
