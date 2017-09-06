class AddSeasonToGames < ActiveRecord::Migration[5.0]
  def change
    add_reference :games, :season, index: true
  end
end
