class RenameGameStatusToStatus < ActiveRecord::Migration[4.2]
  def change
    rename_column :games, :game_status, :status
  end
end
