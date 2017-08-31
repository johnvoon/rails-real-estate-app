class BusinessHour < ApplicationRecord
  serialize :open_time, Tod::TimeOfDay
  serialize :close_time, Tod::TimeOfDay
  has_many :listing_business_hours
  has_many :listings, through: :listing_business_hours
end
