class AddCompanyNameToListings < ActiveRecord::Migration[5.1]
  def change
    add_column :listings, :company_name, :string
  end
end
