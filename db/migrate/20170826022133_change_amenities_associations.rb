class ChangeAmenitiesAssociations < ActiveRecord::Migration[5.1]
  def change
    rename_column :amenities, :listing_id, :listing_amenities_id
  end
end
