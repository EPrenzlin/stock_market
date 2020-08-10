class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :address
      t.string :password_digest
      t.string :description
      t.string :industry 
      t.timestamps
    end
  end
end
