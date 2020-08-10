class CreateShares < ActiveRecord::Migration[6.0]
  def change
    create_table :shares do |t|
      t.integer :company_id 
      t.integer :stock_exchange_id 
      t.integer :price 
      t.string :type 
      t.boolean :dividend
      t.timestamps
    end
  end
end
