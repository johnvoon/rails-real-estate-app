class ModifyOfficeModel < ActiveRecord::Migration[5.1]
  def change
    rename_column :offices, :users_id, :user_id
    remove_column :offices, :unit_number, :string
    remove_column :offices, :floor, :string
    remove_column :offices, :street, :string
    remove_column :offices, :postcode, :string
    remove_column :offices, :city, :string
    remove_column :offices, :state, :string
    remove_column :offices, :country, :string
  end
end
