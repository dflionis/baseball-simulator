FactoryGirl.define do
  factory :mookie_betts, class: Player do
    association :team, factory: :red_sox
    first_name "Mookie"
    last_name "Betts"
    batting_hand "R"
    stealing "A"
    running "1-16"
    avg 0.291
    ab 597
    doubles 42
    triples 8
    hr 18
    rbi 77
    bb 46
    so 82
    sb 21
    cs 6
    slg 0.479
    obp 0.341
    vs_lhp {{
      "1" => {
        "2" => "lineout(1b)",
        "3" => "foulout(3b)",
        "4" => "lineout(3b)",
        "5" => "SINGLE**",
        "6" => "SINGLE(rf)",
        "7" => {
          "1-11" => "SI*",
          "12-20" => "lo(3b)"
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
    }}
    vs_rhp {{
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
        "11" => "SINGLE(lf)",
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
    }}
  end
end
