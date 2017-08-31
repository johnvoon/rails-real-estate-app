class ChangeOfficeToListing < ActiveRecord::Migration[5.1]
  def change
    rename_table :offices, :listings
  end
end
