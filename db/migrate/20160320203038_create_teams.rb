class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.references :division, null: false
      t.string :city, null: false
      t.string :name, null: false
      t.string :logo
      t.timestamps null: false
    end

    add_index :teams, :name, unique: true
  end
end
