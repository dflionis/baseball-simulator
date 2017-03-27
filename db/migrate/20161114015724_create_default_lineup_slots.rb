class CreateDefaultLineupSlots < ActiveRecord::Migration[4.2]
  def change
    create_table :default_lineup_slots do |t|
      t.references :team, null: false
      t.references :player, null: false
      t.integer :slot, null: false
      t.references :position, null: false
      t.timestamps null: false
    end

    add_index :default_lineup_slots, [:team_id, :player_id], unique: true
    add_index :default_lineup_slots, [:team_id, :slot], unique: true
    add_index :default_lineup_slots, [:team_id, :position_id], unique: true
  end
end
