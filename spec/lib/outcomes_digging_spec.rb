require "rails_helper"

RSpec.describe OutcomesDigging do
  subject { player_well_formed_outcomes }

  describe ".validate_red_and_white_dice_values" do
    context "Player" do
      context "well formed outcomes json" do
        it "returns true" do
          expect(OutcomesDigging.validate_red_and_white_dice_values(subject, Player)).to be true
        end
      end

      context "Missing Red Dice Values" do
        subject { player_missing_red_dice_value }

        it "returns false" do
          expect(OutcomesDigging.validate_red_and_white_dice_values(subject, Player)).to be false
        end
      end

      context "Missing White Die Values" do
        subject { player_missing_white_die_value }

        it "returns false" do
          expect(OutcomesDigging.validate_red_and_white_dice_values(subject, Player)).to be false
        end
      end

      context "Ridiculous Dice Values" do
        subject { player_with_ridiculous_dice_value }

        it "returns false" do
          expect(OutcomesDigging.validate_red_and_white_dice_values(subject, Player)).to be false
        end
      end
    end

    context "Pitcher" do
      context "well formed outcomes json" do
        subject { pitcher_well_formed_outcomes }

        it "returns true" do
          expect(OutcomesDigging.validate_red_and_white_dice_values(subject, Pitcher)).to be true
        end
      end

      context "Missing Red Dice Values" do
        subject { pitcher_missing_red_dice_value }

        it "returns false" do
          expect(OutcomesDigging.validate_red_and_white_dice_values(subject, Pitcher)).to be false
        end
      end

      context "Missing White Die Values" do
        subject { pitcher_missing_white_die_value }

        it "returns false" do
          expect(OutcomesDigging.validate_red_and_white_dice_values(subject, Pitcher)).to be false
        end
      end

      context "Ridiculous Dice Values" do
        subject { pitcher_with_ridiculous_dice_values }

        it "returns false" do
          expect(OutcomesDigging.validate_red_and_white_dice_values(subject, Pitcher)).to be false
        end
      end
    end
  end

  describe ".validate_20_sided_die_ranges" do
    context "well formed outcomes json" do
      it "returns true" do
        expect(OutcomesDigging.validate_20_sided_die_ranges(subject)).to be true
      end
    end

    context "Overlapping Range" do
      subject { player_with_overlapping_range }

      it "returns false" do
        expect(OutcomesDigging.validate_20_sided_die_ranges(subject)).to be false
      end
    end

    context "Missing Number in Range" do
      subject { pitcher_with_missing_number_in_range }

      it "returns false" do
        expect(OutcomesDigging.validate_20_sided_die_ranges(subject)).to be false
      end
    end
  end

  def player_well_formed_outcomes
    {
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
    }
  end

  def pitcher_well_formed_outcomes
    {
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
    }
  end

  def player_missing_red_dice_value
    {
      "1" => {
        "2" => "lineout(1b)",
        "3" => "foulout(3b)",
        "4" => "lineout(3b)",
        # 5 is missing!
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
    }
  end

  def player_missing_white_die_value
    {
      # Missing "1"
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
    }
  end

  def player_with_ridiculous_dice_value
    {
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
        # Two dice cannot add to 74
        "74" => "fly (rf) B?",
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
    }
  end

  def pitcher_missing_red_dice_value
    {
      "4" => {
        "2" => {
          "1-3" => "SI*",
          "4-20" => "lo(2b)"
        },
        "3" => "FLY (lf) X",
        "4" => "FLY (cf) X",
        # 5 is missing
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
    }
  end

  def pitcher_missing_white_die_value
    {
      # Missing 4
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
    }
  end

  def pitcher_with_ridiculous_dice_values
    {
      "4" => {
        # Two Dice Can't Make 24
        "24" => {
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
    }
  end

  def player_with_overlapping_range
    {
      "1" => {
        "2" => "lineout(1b)",
        "3" => "foulout(3b)",
        "4" => "lineout(3b)",
        "5" => "SINGLE**",
        "6" => "SINGLE(rf)",
        "7" => {
          # Overlap!
          "1-14" => "SI*",
          "14-20" => "lo(3b)"
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
    }
  end

  def pitcher_with_missing_number_in_range
    {
      "4" => {
        "2" => {
          # Where is 4?
          "1-3" => "SI*",
          "5-20" => "lo(2b)"
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
    }
  end
end
