class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.references :away_team, references: :team, null: false
      t.references :home_team, references: :team, null: false
      t.datetime :start_time, null: false
      t.integer :game_status, null: false
      t.integer :away_score, default: 0
      t.integer :home_score, default: 0
      t.integer :current_inning
    end
  end
end
