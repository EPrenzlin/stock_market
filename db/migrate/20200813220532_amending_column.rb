class AmendingColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :shares, :type ,:integer
    add_column :shares, :preference, :boolean
  end
end
