class CreateGameLineupSlots < ActiveRecord::Migration[4.2]
  def change
    create_table :game_lineup_slots do |t|
      t.references :game, null: false
      t.integer :team, null: false
      t.references :player, null: false
      t.integer :slot, null: false
      t.references :position, null: false
      t.timestamps null: false
    end

    add_index :game_lineup_slots, [:game_id, :team, :player_id], unique: true
    add_index :game_lineup_slots, [:game_id, :team, :slot], unique: true
    add_index :game_lineup_slots, [:game_id, :team, :position_id], unique: true
  end
end
