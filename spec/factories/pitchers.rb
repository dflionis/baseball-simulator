FactoryGirl.define do
  factory :rick_porcello, class: Pitcher do
    association :team, factory: :red_sox
    team team
    first_name "Rick"
    last_name "Porcello"
    pitcher_type "SP"
    throws "R"
    batting_rating "1"
    wins 9
    losses 15
    era 4.92
    starts 28
    saves 0
    innings_pitched 172
    hits_allowed 196
    bb 38
    so 149
    hr_allowed 25 
    vs_lhb {{
      "4" => {
        "2" => {
          "1-3" => "SI*",
          "4-20" => "lo(2b)"
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
    }}
    vs_rhb {{
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
    }}
  end
end
