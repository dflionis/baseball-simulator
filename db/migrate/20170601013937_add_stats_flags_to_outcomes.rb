class AddStatsFlagsToOutcomes < ActiveRecord::Migration[5.0]
  def change
    add_column :outcomes, :ab, :boolean, null: false, default: true, after: :code
    add_column :outcomes, :h, :boolean, null: false, default: false, after: :ab
    add_column :outcomes, :bb, :boolean, null: false, default: false, after: :h
    add_column :outcomes, :so, :boolean, null: false, default: false, after: :bb
    add_column :outcomes, :double, :boolean, null: false, default: false, after: :so
    add_column :outcomes, :triple, :boolean, null: false, default: false, after: :doubles
    add_column :outcomes, :hr, :boolean, null: false, default: false, after: :triples
  end
end
