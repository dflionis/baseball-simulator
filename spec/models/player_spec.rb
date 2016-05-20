require "rails_helper"

RSpec.describe Player do
  let(:red_sox) { create(:red_sox) }

  subject { well_formed_player }

  it { should belong_to(:team) }

  it { should have_many(:player_positions) }
  it { should have_many(:positions).through(:player_positions) }

  it { should validate_presence_of(:team) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:batting_hand) }
  it { should validate_presence_of(:stealing) }
  it { should validate_presence_of(:running) }
  it { should validate_presence_of(:vs_lhp) }
  it { should validate_presence_of(:vs_rhp) }
  it { should validate_presence_of(:avg) }
  it { should validate_presence_of(:ab) }
  it { should validate_presence_of(:doubles) }
  it { should validate_presence_of(:triples) }
  it { should validate_presence_of(:hr) }
  it { should validate_presence_of(:rbi) }
  it { should validate_presence_of(:bb) }
  it { should validate_presence_of(:so) }
  it { should validate_presence_of(:sb) }
  it { should validate_presence_of(:cs) }
  it { should validate_presence_of(:slg) }
  it { should validate_presence_of(:obp) }

  it { should validate_numericality_of(:avg).is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:ab).is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:doubles).is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:triples).is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:hr).is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:rbi).is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:bb).is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:so).is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:sb).is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:cs).is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:slg).is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:obp).is_greater_than_or_equal_to(0) }

  describe "#vs_lhp" do
    context "missing white die value" do
      subject { player_missing_white_die_vs_lhp }

      it "rejects player cards without a vs_lhp white dice value of 1" do
        expect { subject.save! }.to raise_error(ActiveRecord::RecordNotSaved) 
      end
    end

    context "missing red dice value" do
      subject { player_missing_red_dice_vs_lhp }

      it "rejects a player card with a missing vs_lhp red dice value" do
        expect { subject.save! }.to raise_error(ActiveRecord::RecordNotSaved) 
      end
    end
  end

  describe "vs_rhp" do
    context "missing white die value" do
      subject { player_missing_white_die_vs_rhp }

      it "rejects player cards without a white dice vs_rhp value of 2" do
        expect { subject.save! }.to raise_error(ActiveRecord::RecordNotSaved) 
      end
    end

    context "missing red dice value" do
      subject { player_missing_red_dice_vs_rhp }

      it "rejects a player card with a missing vs_rhp red dice value" do
        expect { subject.save! }.to raise_error(ActiveRecord::RecordNotSaved) 
      end
    end
  end

  def well_formed_player
    Player.new(
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
      }
    )
  end

  def player_missing_white_die_vs_lhp
    well_formed_player.tap do |player|
      player.vs_lhp = {
        # Missing "1" white dice
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
  end

  def player_missing_red_dice_vs_lhp
    well_formed_player.tap do |player|
      player.vs_lhp = {
        "1" => {
          "2" => "lineout(1b)",
          "3" => "foulout(3b)",
          # 4 is missing!
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
  end

  def player_missing_white_die_vs_rhp
    well_formed_player.tap do |player|
      player.vs_rhp = {
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
        # Missing "2" white die values
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
    end
  end

  def player_missing_red_dice_vs_rhp
    well_formed_player.tap do |player|
      player.vs_rhp = {
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
          # Missing "6"
          "7" => "gb (ss) B+",
          "8" => "popout (ss)",
          "9" => "popout (ss)",
          "10" => "lineout (3b)",
          "11" => "foulout (3b)",
          "12" => "WALK"
        }
      }
    end
  end
end
