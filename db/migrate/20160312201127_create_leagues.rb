class CreateLeagues < ActiveRecord::Migration[4.2]
  def change
    create_table :leagues do |t|
      t.string :name, null: false
      t.boolean :dh, null: false
      t.string :logo
      t.timestamps null: false
    end
  end
end
