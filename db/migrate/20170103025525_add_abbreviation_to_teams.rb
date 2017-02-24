class AddAbbreviationToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :abbreviation, :string, limit: 3, null: false, after: :name
  end
end
