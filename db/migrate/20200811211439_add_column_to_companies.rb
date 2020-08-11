class AddColumnToCompanies < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :uid, :integer, limit:32
  end
end
