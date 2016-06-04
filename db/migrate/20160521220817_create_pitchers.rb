class CreatePitchers < ActiveRecord::Migration
  def up
    execute <<-SQL
      CREATE TYPE throws AS ENUM('R', 'L');
      CREATE TYPE batting_rating AS ENUM('1', '2', '3', '4', '5');
    SQL

    create_table :pitchers do |t|
      t.references :team, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.column :throws, :throws, null: false
      t.json :vs_lhb, null: false
      t.json :vs_rhb, null: false
      t.column :batting_rating, :batting_rating, null: false
      t.integer :wins, null: false
      t.integer :losses, null: false
      t.decimal :era, precision: 3, scale: 2, null: false
      t.integer :starts, null: false
      t.integer :saves, null: false
      t.integer :innings_pitched, null: false
      t.integer :hits_allowed, null: false
      t.integer :bb, null: false
      t.integer :so, null: false
      t.integer :hr_allowed, null: false
      t.string :image_small
      t.string :image_large
      t.timestamps null: false
    end
  end

  def down
    drop_table :pitchers

    execute <<-SQL
      DROP TYPE batting_rating;
      DROP TYPE throws;
    SQL
  end
end
