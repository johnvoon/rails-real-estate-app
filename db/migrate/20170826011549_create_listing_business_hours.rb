class CreateListingBusinessHours < ActiveRecord::Migration[5.1]
  def change
    create_table :listing_business_hours do |t|
      t.column :listing_id, :integer
      t.column :business_hour_id, :integer
      t.timestamps
    end
  end
end
