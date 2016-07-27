class AddOutsToInnings < ActiveRecord::Migration
  def change
    add_column :innings, :outs, :integer, default: 0, after: :status
  end
end
