class CreateRentalRates < ActiveRecord::Migration[5.1]
  def change
    create_table :rental_rates do |t|
      t.money :rental_rate
      t.column :rental_rate_unit, :integer, default: 0
      t.timestamps
    end
  end
end
