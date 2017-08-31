class RentalRate < ApplicationRecord
  enum rental_rate_unit: {
    hour: 0,
    day: 1,
    month: 2,
    year: 3
  }
end
