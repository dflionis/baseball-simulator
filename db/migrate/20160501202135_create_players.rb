class CreatePlayers < ActiveRecord::Migration[4.2]
  def up
    execute <<-SQL
      CREATE TYPE batting_hand AS ENUM('R', 'L', 'S');
      CREATE TYPE stealing AS ENUM('AA', 'A', 'B', 'C', 'D', 'E');
      CREATE TYPE running AS ENUM(
        '1-19', '1-18', '1-17', '1-16', '1-15', '1-14', '1-13',
        '1-12', '1-11', '1-10', '1-9', '1-8', '1-7', '1-6', '1-5',
        '1-4', '1-3', '1-2'
      );
    SQL

    create_table :players do |t|
      t.references :team, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.column :batting_hand, :batting_hand, null: false
      t.column :stealing, :stealing, null: false
      t.column :running, :running, null: false
      t.json :vs_lhp, null: false
      t.json :vs_rhp, null: false
      t.decimal :avg, null: false, precision: 3, scale: 3
      t.integer :ab, null: false, limit: 2
      t.integer :doubles, null: false
      t.integer :triples, null: false
      t.integer :hr, null: false, limit: 2
      t.integer :rbi, null: false, limit: 2
      t.integer :bb, null: false, limit: 2
      t.integer :so, null: false, limit: 2
      t.integer :sb, null: false, limit: 2
      t.integer :cs, null: false, limit: 2
      t.decimal :slg, precision: 3, scale: 3, null: false
      t.decimal :obp, precision: 3, scale: 3, null: false
      t.string :image_small
      t.string :image_large
      t.timestamps null: false
    end
  end

  def down
    drop_table :players
    execute <<-SQL
      DROP TYPE batting_hand;
      DROP TYPE stealing;
      DROP TYPE running;
    SQL
  end
end
