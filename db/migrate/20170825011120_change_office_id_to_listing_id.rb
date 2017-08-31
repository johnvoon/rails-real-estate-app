class ChangeOfficeIdToListingId < ActiveRecord::Migration[5.1]
  def change
    rename_column :addresses, :office_id, :listing_id
    rename_column :amenities, :office_id, :listing_id
    rename_column :business_hours, :office_id, :listing_id
    add_reference :rental_rates, :listing, index: true, foreign_key: true
  end
end
