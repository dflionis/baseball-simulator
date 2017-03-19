class CreatePlateAppearances < ActiveRecord::Migration[4.2]
  def change
    create_table :plate_appearances do |t|
      t.references :inning, null: false
      t.references :batter, references: :player, null: false
      t.references :pitcher, null: false
      t.references :runner_on_first, references: :player, default: nil
      t.references :runner_on_second, references: :player, default: nil
      t.references :runner_on_third, references: :player, default: nil
      t.references :outcome,  null: false
      t.boolean :ab, default: true
      t.boolean :h, default: false
      t.boolean :hr, default: false
      t.boolean :bb, default: false
      t.boolean :so, default: false
      t.boolean :double, default: false
      t.boolean :triple, default: false
      t.timestamps null: false
    end
  end
end
