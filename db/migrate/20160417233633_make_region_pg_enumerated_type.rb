class MakeRegionPgEnumeratedType < ActiveRecord::Migration
  def up
    execute <<-SQL
      CREATE TYPE region AS ENUM('East', 'Central', 'West');
    SQL

    change_column :divisions, :region, "region USING ('East')"
  end

  def down
    execute <<-SQL
      CREATE OR REPLACE FUNCTION region_name_to_integer(region) RETURNS INTEGER
        AS $$ SELECT
        CASE
          WHEN $1 = 'East' THEN 0
          WHEN $1 = 'Central' THEN 1
          WHEN $1 = 'West' THEN 2
        END $$ LANGUAGE SQL;
    SQL

    change_column :divisions, :region, "INTEGER USING region_name_to_integer(region)"

    execute <<-SQL
      DROP FUNCTION region_name_to_integer(region);
      DROP TYPE region; 
    SQL
  end
end
