puts "Creating Pitchers..."
red_sox = Team.find_by(name: "Red Sox")
yankees = Team.find_by(name: "Yankees")

Pitcher.create!(
  team: red_sox,
  first_name: "Rick",
  last_name: "Porcello",
  pitcher_type: "SP",
  throws: "R",
  batting_rating: "1",
  wins: 9,
  losses: 15,
  era: 4.92,
  starts: 28,
  saves: 0,
  innings_pitched: 172,
  hits_allowed: 196,
  bb: 38,
  so: 149,
  hr_allowed: 25, 
  vs_lhb: {
    "4" => {
      "2" => {
        "1-3" => "SI*",
        "4-20" => "lo (2b)"
      },
      "3" => "FLY (lf) X",
      "4" => "FLY (cf) X",
      "5" => "strikeout",
      "6" => "GB (2b) X",
      "7" => {
        "1-3" => "DO**",
        "4-20" => "SI**"
      },
      "8" => "SINGLE (cf)",
      "9" => "strikeout",
      "10" => "WALK",
      "11" => "FLY (rf) X",
      "12" => "GB (2b) X"
    },
    "5" => {
      "2" => "fly (cf) B",
      "3" => "fly (cf) B",
      "4" => "GB (ss) X",
      "5" => "GB (ss) X",
      "6" => "DOUBLE (rf)",
      "7" => "strikeout",
      "8" => {
        "1-14" => "SI*",
        "15-20" => "lo (2b)"
      },
      "9" => "gb (1b) A",
      "10" => "fly (rf) C",
      "11" => "GB (p) X",
      "12" => "fly (lf) B"
    },
    "6" => {
      "2" => "GB (1b) X",
      "3" => {
        "1-19" => "HR",
        "20" => "fly (rf) B"
      },
      "4" => "CATCH-X",
      "5" => {
        "1-18" => "HR",
        "19-20" => "TR"
      },
      "6" => "fly (rf) B",
      "7" => "gb (2b) A",
      "8" => "strikeout",
      "9" => "strikeout",
      "10" => "GB (3b) X",
      "11" => "SINGLE (cf)",
      "12" => "GB (1b) X"
    }
  },
  vs_rhb: {
    "4" => {
      "2" => {
        "1-16" => "HR",
        "17-20" => "fly (lf) B"
      },
      "3" => "FLY (lf) X",
      "4" => "FLY (cf) X",
      "5" => "fly (cf) B",
      "6" => "GB (2b) X",
      "7" => "SINGLE**",
      "8" => {
        "1-19" => "SI*",
        "20" => "gb (3b) A"
      },
      "9" => "fly (cf) B",
      "10" => "fly (cf) C",
      "11" => "FLY (rf) X",
      "12" => "GB (2b) X"
    },
    "5" => {
      "2" => "fly (lf) B",
      "3" => "fly (rf) B",
      "4" => "GB (ss) X",
      "5" => "GB (ss) X",
      "6" => "SINGLE (cf)",
      "7" => "strikeout",
      "8" => "strikeout",
      "9" => "gb (ss) A",
      "10" => "WALK",
      "11" => "GB (p) X",
      "12" => {
        "1" => "SI*",
        "2-20" => "lo (ss)"
      }
    },
    "6" => {
      "2" => "fly (rf) B",
      "3" => "SINGLE (cf)",
      "4" => "CATCH-X",
      "5" => {
        "1-7" => "HR",
        "8-20" => "DO"
      },
      "6" => {
        "1-11" => "DO**",
        "12-20" => "SI**"
      },
      "7" => "strikeout",
      "8" => "strikeout",
      "9" => "gb (3b) A",
      "10" => "GB (3b) X",
      "11" => "GB (1b) X",
      "12" => "gb (ss) A"
    }
  }
)

Pitcher.create!(
  team: yankees,
  first_name: "C.C.",
  last_name: "Sabathia",
  pitcher_type: "SP",
  throws: "L",
  batting_rating: "1",
  wins: 6,
  losses: 10,
  era: 4.73,
  starts: 29,
  saves: 0,
  innings_pitched: 167,
  hits_allowed: 188,
  bb: 50,
  so: 137,
  hr_allowed: 28, 
  vs_lhb: {
    "4" => {
      "2" => "GB (1b) X",
      "3" => "FLY (rf) X",
      "4" => "GB (3b) X",
      "5" => "strikeout",
      "6" => "strikeout",
      "7" => "strikeout",
      "8" => {
        "1-4" => "TR",
        "5-20" => "fly (cf) B"
      },
      "9" => "strikeout",
      "10" => "gb (1b) A",
      "11" => "fly (cf) B",
      "12" => "gb (1b) X"
    },
    "5" => {
      "2" => "GB (2b) X",
      "3" => "SINGLE (rf)",
      "4" => "fly (cf) C",
      "5" => {
        "1-9" => "N-HR",
        "10-20" => "fly (rf) B"
      },
      "6" => "gb (2b) A",
      "7" => "strikeout",
      "8" => "GB (2b) X",
      "9" => "strikeout",
      "10" => "CATCH-X",
      "11" => "FLY (lf) X",
      "12" => {
        "1-12" => "N-HR",
        "13-20" => "fly (rf) B"
      }
    },
    "6" => {
      "2" => {
        "1-16" => "SI*",
        "17-20" => "lo (2b)"
      },
      "3" => "WALK",
      "4" => "FLY (cf) X",
      "5" => "strikeout",
      "6" => "strikeout",
      "7" => {
        "1-9" => "SI*",
        "10-20" => "lo (1b)"
      },
      "8" => "strikeout",
      "9" => "GB (ss) X",
      "10" => "GB (ss) X",
      "11" => "GB (p) X",
      "12" => "gb (1b) A"
    }
  },
  vs_rhb: {
    "4" => {
      "2" => "GB (1b) X",
      "3" => "FLY (rf) X",
      "4" => "GB (3b) X",
      "5" => "fly (cf) B",
      "6" => "SINGLE (cf)",
      "7" => "WALK",
      "8" => {
        "1" => "TR",
        "2-20" => "SI**"
      },
      "9" => "fly (rf) B",
      "10" => "gb (3b) A",
      "11" => {
        "1-4" => "SI*",
        "5-20" => "lo (ss)"
      },
      "12" => "GB (1b) X"
    },
    "5" => {
      "2" => "GB (2b) X",
      "3" => "N-HR",
      "4" => "fly (lf) C",
      "5" => {
        "1-18" => "N-HR",
        "19-20" => "TR"
      },
      "6" => "strikeout",
      "7" => {
        "1-6" => "SI*",
        "7-20" => "lo (3b)"
      },
      "8" => "GB (2b) X",
      "9" => "strikeout",
      "10" => "CATCH-X",
      "11" => "FLY (lf) X",
      "12" => {
        "1-9" => "N-HR",
        "10-20" => "fly (lf) B"
      }
    },
    "6" => {
      "2" => "fly (lf) B",
      "3" => "SINGLE (lf)",
      "4" => "FLY (cf) X",
      "5" => "gb (ss) A",
      "6" => "strikeout",
      "7" => {
        "1-10" => "DO**",
        "11-20" => "SI**"
      },
      "8" => "SINGLE (lf)",
      "9" => "GB (ss) X",
      "10" => "GB (ss) X",
      "11" => "GB (p) X",
      "12" => "WALK"
    }
  }
)
