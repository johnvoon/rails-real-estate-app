class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :unit_number
      t.string :floor
      t.string :street
      t.string :postcode
      t.string :city
      t.string :state
      t.string :country
      t.timestamps
    end
  end
end
