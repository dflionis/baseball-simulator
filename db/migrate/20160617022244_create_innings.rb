class CreateInnings < ActiveRecord::Migration
  def change
    create_table :innings do |t|
      t.references :game, null: false
      t.integer :number, null: false
      t.integer :half, null: false
      t.integer :status, null: false
      t.integer :runs
      t.timestamps null: false
    end

    add_index :innings, [:game_id, :number, :half], unique: true
  end
end
