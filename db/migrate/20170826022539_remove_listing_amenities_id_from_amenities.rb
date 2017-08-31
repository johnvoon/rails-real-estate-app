class RemoveListingAmenitiesIdFromAmenities < ActiveRecord::Migration[5.1]
  def change
    remove_column :amenities, :listing_amenities_id, :integer
  end
end
