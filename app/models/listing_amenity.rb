class ListingAmenity < ApplicationRecord
  belongs_to :listing
  belongs_to :amenity
  validates :listing_id, presence: true
  validates :amenity_id, presence: true
end
