class Listing < ApplicationRecord
  belongs_to :tenant
  has_one :address
  has_many :rental_rates
  has_many :listing_amenities
  has_many :amenities, through: :listing_amenities
  has_many :listing_business_hours
  has_many :business_hours, through: :listing_business_hours
  enum minimum_term_unit: {
    hour: 0,
    day: 1,
    month: 2,
    year: 3
  }

  def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end
end

