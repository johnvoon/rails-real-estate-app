class CreateBusinessHours < ActiveRecord::Migration[5.1]
  def change
    create_table :business_hours do |t|
      t.belongs_to :listing
      t.integer :day
      t.time :open_time
      t.time :close_time
      t.timestamps
    end
  end
end
