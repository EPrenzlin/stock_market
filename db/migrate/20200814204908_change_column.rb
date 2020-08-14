class ChangeColumn < ActiveRecord::Migration[6.0]
  def change
    add_column :stock_exchanges, :country, :string
  end
end
