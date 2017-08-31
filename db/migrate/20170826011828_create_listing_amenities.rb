class CreateListingAmenities < ActiveRecord::Migration[5.1]
  def change
    create_table :listing_amenities do |t|
      t.column :listing_id, :integer
      t.column :amenity_id, :integer
      t.timestamps
    end
  end
end
