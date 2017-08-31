class CreateTenants < ActiveRecord::Migration[5.1]
  def change
    create_table :tenants do |t|
      t.belongs_to :listing
      t.timestamps
    end
  end
end
