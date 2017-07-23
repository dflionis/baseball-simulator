class AddStatsToGameLineupSlots < ActiveRecord::Migration[5.0]
  def change
    add_column :game_lineup_slots, :ab, :integer, null: false, default: 0, after: :position_id
    add_column :game_lineup_slots, :r, :integer, null: false, default: 0, after: :ab
    add_column :game_lineup_slots, :h, :integer, null: false, default: 0, after: :r
    add_column :game_lineup_slots, :rbi, :integer, null: false, default: 0, after: :h
    add_column :game_lineup_slots, :bb, :integer, null: false, default: 0, after: :rbi
    add_column :game_lineup_slots, :so, :integer, null: false, default: 0, after: :bb
    add_column :game_lineup_slots, :doubles, :integer, null: false, default: 0, after: :so
    add_column :game_lineup_slots, :triples, :integer, null: false, default: 0, after: :doubles
    add_column :game_lineup_slots, :hr, :integer, null: false, default: 0, after: :triples
  end
end
