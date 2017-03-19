class CreatePositions < ActiveRecord::Migration[4.2]
  def change
    create_table :positions do |t|
      t.string :name, null: false, unique: true
      t.string :abbreviation, null: false, limit: 2
      t.string :scorebook_id, null: false, limit: 2
    end
  end
end
