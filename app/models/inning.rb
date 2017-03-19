class Inning < ApplicationRecord
  belongs_to :game

  has_many :plate_appearances

  enum half: [:top, :bottom]
  enum status: [:in_progress, :completed]

  validates :game, presence: true
  validates :number, presence: true
  validates :half, presence: true, uniqueness: { scope: [:game, :number] }
  validates :status, presence: true

  validates_inclusion_of :outs, :in => 0..3

  validates :number, numericality: { greater_than_or_equal_to: 1 }
  validates :runs, numericality: { greater_than_or_equal_to: 0 }

  after_initialize :set_default_values
  before_save :ensure_inning_sequence
  before_save :update_status, unless: :destroyed?

  # TODO: Switch to after_commit and use https://github.com/grosser/test_after_commit
  after_save :update_game_score, unless: :destroyed?

  attr_accessor :man_on_first, :man_on_second, :man_on_third

  def play!
    while !completed? do
      play_next_at_bat! 
      save!
      break if game.going_final?
    end
  end

  def play_next_at_bat!
    hitter_index = game.hitting_team == "away" ? game.increment_away_hitter_index : game.increment_home_hitter_index
    hitter = lineup[hitter_index]

    plate_appearance = PlateAppearance.create!(
      inning: self,
      pitcher: pitcher,
      batter: lineup[hitter_index],
      runner_on_first: man_on_first,
      runner_on_second: man_on_second,
      runner_on_third: man_on_third
    )
    

    puts "#{hitter.first_name} #{hitter.last_name} #{plate_appearance.outcome.code}" unless Rails.env.test?
  end

  def lineup
    game.hitting_team == "away" ? game.lineups[:away_lineup] : game.lineups[:home_lineup]
  end

  def pitcher
    game.hitting_team == "away" ? game.home_pitcher : game.away_pitcher
  end

  def add_one_out
    if (0..2).include?(self.outs)
      self.update(outs: self.outs + 1)
    else
      raise "There are already 3 outs"
    end
  end

  def add_two_outs
    if (0..1).include?(self.outs)
      self.update(outs: self.outs + 2)
    elsif self.outs == 2
      self.update(outs: 3)
    else
      raise "There are already 3 outs"
    end
  end

  def two_outs?
    outs == 2
  end

  def three_outs?
    outs == 3
  end

  def runners_advance_one_base
    return if bases_empty

    if man_on_third
      self.man_on_third = nil
      self.runs += 1
    end

    if man_on_second
      self.man_on_third = man_on_second
      self.man_on_second = nil
    end

    if man_on_first
      self.man_on_second = man_on_first
      self.man_on_first = nil
    end
  end

  def runners_advance_two_bases
    return if bases_empty

    if man_on_third
      self.man_on_third = nil
      self.runs += 1
    end

    if man_on_second
      self.man_on_second = nil
      self.runs += 1
    end

    if man_on_first
      self.man_on_third = man_on_first
      self.man_on_first = nil
    end
  end


  def clear_bases
    self.man_on_first, self.man_on_second, self.man_on_third = nil, nil, nil    
  end

  def runner_from_third_scores
    return if man_on_third.nil?
    self.man_on_third = nil
    self.runs += 1
  end

  def everyone_scores_except_batter
    self.runs += [man_on_third, man_on_second, man_on_first].compact.size
    clear_bases
  end

  def everyone_scores_including_batter
    self.runs += ([man_on_third, man_on_second, man_on_first].compact.size + 1)
    clear_bases
  end

  def at_least_one_runner_forced?
    man_on_first
  end

  private

  def set_default_values
    self.outs ||= 0
    self.runs ||= 0
  end

  def bases_empty
    man_on_first.nil? && man_on_second.nil? && man_on_third.nil?
  end

  def ensure_inning_sequence
    if number == 1 && half == "top"
      true
    elsif half == "bottom"
      raise "incorrect inning sequence" unless top_of_the_inning_exists
    elsif half == "top"
      raise "incorrect inning sequence" unless bottom_of_previous_inning_exists
    else
      raise "unreachable condition"
    end
  end

  def top_of_the_inning_exists
    game.innings.
      where(
        number: number, 
        half: Inning.halves["top"], 
        status: Inning.statuses["completed"]).
      count == 1
  end

  def bottom_of_previous_inning_exists
    game.innings.
      where( 
        number: (number - 1), 
        half: Inning.halves["bottom"], 
        status: Inning.statuses["completed"]).
      count == 1
  end

  def update_game_score
    if half == "top"
      game.update(away_score: game.innings.where(half: Inning.halves["top"]).sum(:runs))
    else
      game.update(home_score: game.innings.where(half: Inning.halves["bottom"]).sum(:runs))
    end
  end

  def update_status
    if self.outs == 3 || home_team_walks_off?
      self.status = :completed
    end
  end

  def home_team_walks_off?
    game.home_score > game.away_score && number >= 9 && half == "bottom"
  end
end
