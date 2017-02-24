class RenameGameStatusToStatus < ActiveRecord::Migration
  def change
    rename_column :games, :game_status, :status
  end
end
