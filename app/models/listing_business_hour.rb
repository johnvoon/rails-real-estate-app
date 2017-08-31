class ListingBusinessHour < ApplicationRecord
  belongs_to :listing
  belongs_to :business_hour
  validates :listing_id, presence: true
  validates :business_hour_id, presence: true
end
