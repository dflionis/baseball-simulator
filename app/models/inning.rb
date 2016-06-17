class Inning < ActiveRecord::Base
  belongs_to :game

  enum half: [:top, :bottom]
  enum status: [:in_progress, :completed]

  validates :game, presence: true
  validates :number, presence: true
  validates :half, presence: true, uniqueness: { scope: [:game, :number] }
  validates :status, presence: true

  validates :number, numericality: { greater_than_or_equal_to: 1 }
  validates :runs, numericality: { greater_than_or_equal_to: 0 }

  before_save :ensure_inning_sequence

  private

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
end
