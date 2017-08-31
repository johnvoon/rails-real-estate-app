class AddTitleToListing < ActiveRecord::Migration[5.1]
  def change
    add_column :listings, :title, :string
  end
end
