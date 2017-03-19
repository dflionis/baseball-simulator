class AddOutsToInnings < ActiveRecord::Migration[4.2]
  def change
    add_column :innings, :outs, :integer, default: 0, after: :status
  end
end
