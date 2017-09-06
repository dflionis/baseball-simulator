class CreateSeasons < ActiveRecord::Migration[5.0]
  def change
    create_table :seasons do |t|
      t.string :name, null: false
      t.integer :status, null: false
      t.timestamps null: false
    end
  end
end
