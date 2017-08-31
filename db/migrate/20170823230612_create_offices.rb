class CreateOffices < ActiveRecord::Migration[5.1]
  def change
    create_table :offices do |t|
      t.money :rental_rate
      t.column :rental_rate_unit, :integer, default: 0
      t.money :deposit_payable
      t.string :unit_number
      t.string :floor
      t.string :street
      t.string :postcode
      t.string :city
      t.string :state
      t.string :country
      t.integer :seats
      t.integer :size
      t.date :availability_start_date
      t.date :availability_end_date
      t.integer :minimum_term
      t.column :minimum_term_unit, :integer, default: 0
      t.belongs_to :users
      t.timestamps
    end
  end
end
