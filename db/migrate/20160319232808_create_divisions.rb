class CreateDivisions < ActiveRecord::Migration[4.2]
  def change
    create_table :divisions do |t|
      t.references :league, null: false
      t.integer :region, null: false
      t.timestamps null: false
    end

    add_index :divisions, [:id, :region], unique: true
  end
end
