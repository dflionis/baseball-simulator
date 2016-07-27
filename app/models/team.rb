class Team < ActiveRecord::Base
  belongs_to :division

  has_many :players
  has_many :pitchers

  validates :division, presence: true
  validates :city, presence: true
  validates :name, presence: true, uniqueness: true
  validates :abbreviation, presence: true, uniqueness: true

  def full_name
    city + " " + name
  end

  def default_lineup
    DefaultLineupSlot.where(
      team: self 
    ).order(:slot).
    map(&:player)
  end

  def load_default_lineup(game:, home:)
    create_game_lineup_from_default(game: game, home: home)

    GameLineupSlot.where(
      team: home ? GameLineupSlot.teams[:home] : GameLineupSlot.teams[:away],
      game: game
    ).order(:slot).
    map(&:player)
  end

  private

  def delete_existing_lineup(game:, home:)
    GameLineupSlot.where(
      game: game,
      team: home ? GameLineupSlot.teams[:home] : GameLineupSlot.teams[:away]
    ).delete_all
  end

  def create_game_lineup_from_default(game:, home:)
    delete_existing_lineup(game: game, home: home)

    DefaultLineupSlot.where(team: self).each do |dls|
      GameLineupSlot.create!(
        game: game,
        team: home ? GameLineupSlot.teams[:home] : GameLineupSlot.teams[:away], 
        player: dls.player,
        slot: dls.slot,
        position: dls.position
      )
    end
  end
end
