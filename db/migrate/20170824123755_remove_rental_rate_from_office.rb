class RemoveRentalRateFromOffice < ActiveRecord::Migration[5.1]
  def change
    remove_column :offices, :rental_rate, :money
    remove_column :offices, :rental_rate_unit, :integer
  end
end
