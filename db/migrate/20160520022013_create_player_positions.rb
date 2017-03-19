class CreatePlayerPositions < ActiveRecord::Migration[4.2]
  def up
    execute <<-SQL
      CREATE TYPE fielding_rating AS ENUM('1', '2', '3', '4', '5');
    SQL

    create_table :player_positions do |t|
      t.references :player, null: false
      t.references :position, null: false
      t.column :fielding_rating, :fielding_rating, null: false
      t.integer :frequency, null: false
      t.timestamps null: false
    end

    add_index :player_positions, [:player_id, :position_id], unique: true
  end

  def down
    drop_table :player_positions
    execute "DROP TYPE fielding_rating"
  end
end
