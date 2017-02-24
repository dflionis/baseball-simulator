class Game < ActiveRecord::Base
  belongs_to :away_team, class_name: "Team"
  belongs_to :home_team, class_name: "Team"

  has_many :innings, dependent: :destroy

  enum status: [:scheduled, :in_progress, :final]

  validates :away_team, presence: true
  validates :home_team, presence: true
  validates :start_time, presence: true

  validates :away_score, numericality: { greater_than_or_equal_to: 0 },
    if: :in_progress?
  validates :away_score, numericality: { greater_than_or_equal_to: 0 },
    if: :final?
  validates :home_score, numericality: { greater_than_or_equal_to: 0 },
    if: :in_progress?
  validates :home_score, numericality: { greater_than_or_equal_to: 0 },
    if: :final?
  validates :current_inning, presence: true, numericality: { greater_than_or_equal_to: 1 },
    if: :in_progress?

  before_save :sync_current_inning_with_status, :prevent_mirror_matches

  def next_half_inning
    completed_half_innings = innings.completed.count

    if innings.in_progress.count > 0
      innings.in_progress.first
    else
      Inning.new(
        game: self,
        half: innings.completed.count % 2 == 0 ? :top : :bottom,
        status: :in_progress,
        number: next_inning(completed_half_innings),
        runs: 0  
      )
    end
  end

  def going_final?
    # NOTE: Candidate for cleanup and also for being private/executed via callback
    return if self.final?

    if tie_score
      false
    elsif !top_of_9th_completed
      false
    elsif top_of_9th_completed && home_team_leads
      end_game
      true
    elsif at_least_9_full_played && away_team_leads && even_number_of_half_innings_started && even_number_of_half_innings_completed
      end_game 
      true
    elsif !even_number_of_half_innings_completed && away_team_leads
      false
    elsif at_least_9_full_played && even_number_of_half_innings_completed && away_team_leads
      false
    else
      raise "Unreachable condition was reached"
    end
  end

  def print_line_score
    if innings.completed.count > 18
      puts "We need to implement extra inning flexible line scores!"
    else 
      print "Team  "
      puts "1  2  3  4  5  6  7  8  9  R  H  E"

      print away_team.abbreviation + "   "
      innings.where(half: Inning.halves["top"]).order(:number).each do |i|
        print i.runs
        print "  "
      end
      print away_score
      print "  "
      print "?"
      print "  "
      puts "?"

      print home_team.abbreviation + "   "
      home_innings = innings.where(half: Inning.halves["bottom"]).order(:number)
      home_innings.push(OpenStruct.new(runs: "X")) if home_innings.count == 8
      home_innings.each do |i|
        print i.runs
        print "  "
      end
      print home_score
      print "  "
      print "?"
      print "  "
      puts "?"
    end
  end

  private

  def sync_current_inning_with_status
    self.current_inning = nil if self.final? || self.scheduled?
  end

  def prevent_mirror_matches
    raise "We currently do not support mirror matches" if self.away_team == self.home_team
  end

  def next_inning(completed_half_innings)
    if completed_half_innings % 2 == 0
      (completed_half_innings + 2) / 2
    else
      (completed_half_innings + 1) / 2
    end
  end

  def close_out_final_inning
    self.innings.order(:number, :half).last.update(status: :completed)
  end

  def end_game
    close_out_final_inning
    update(status: :final)
  end

  def tie_score
    away_score == home_score
  end

  def top_of_9th_completed
    innings.completed.count >= 17
  end

  def home_team_leads
    home_score > away_score
  end

  def away_team_leads
    away_score > home_score
  end

  def at_least_9_full_played
    innings.completed.count >= 18
  end

  def even_number_of_half_innings_completed
    innings.completed.count % 2 == 0
  end

  def even_number_of_half_innings_started
    innings.count % 2 == 0
  end
end
