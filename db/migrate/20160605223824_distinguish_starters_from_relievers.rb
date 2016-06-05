class DistinguishStartersFromRelievers < ActiveRecord::Migration
  def up
    execute <<-SQL
      CREATE TYPE pitcher_type AS ENUM('SP', 'RP', 'SP/RP', 'RP/SP');
    SQL
 
    add_column :pitchers, :pitcher_type, :pitcher_type, null:false, default: "RP", after: :last_name 
    change_column_default :pitchers, :pitcher_type, nil 
  end

  def down
    remove_column :pitchers, :pitcher_type

    execute <<-SQL
      DROP TYPE pitcher_type;
    SQL
  end
end
