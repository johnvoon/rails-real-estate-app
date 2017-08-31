class RemoveFloorFromAddresses < ActiveRecord::Migration[5.1]
  def change
    remove_column :addresses, :floor, :string
  end
end
