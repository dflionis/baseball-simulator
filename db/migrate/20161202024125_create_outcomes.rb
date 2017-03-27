class CreateOutcomes < ActiveRecord::Migration[4.2]
  def change
    create_table :outcomes do |t|
      t.string :code, null: false
      t.timestamps null: false
    end

    add_index :outcomes, :code
  end
end
