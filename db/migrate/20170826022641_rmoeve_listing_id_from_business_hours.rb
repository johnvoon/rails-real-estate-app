class RmoeveListingIdFromBusinessHours < ActiveRecord::Migration[5.1]
  def change
    remove_column :business_hours, :listing_id, :integer
  end
end
