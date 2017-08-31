class CreateAmenities < ActiveRecord::Migration[5.1]
  def change
    create_table :amenities do |t|
      t.string :description
      t.belongs_to :office
      t.timestamps
    end
  end
end
