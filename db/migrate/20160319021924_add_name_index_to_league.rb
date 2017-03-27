class AddNameIndexToLeague < ActiveRecord::Migration[4.2]
  def change
    add_index :leagues, :name, unique: true
  end
end
