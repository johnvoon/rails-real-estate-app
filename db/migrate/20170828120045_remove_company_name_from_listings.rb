class RemoveCompanyNameFromListings < ActiveRecord::Migration[5.1]
  def change
    remove_column :listings, :company_name, :string
  end
end
