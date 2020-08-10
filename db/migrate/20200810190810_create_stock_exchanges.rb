class CreateStockExchanges < ActiveRecord::Migration[6.0]
  def change
    create_table :stock_exchanges do |t|
      t.string :name 
      t.string :address 
      t.string :history
      t.timestamps
    end
  end
end
