class ChangeListingUserIdToTenantId < ActiveRecord::Migration[5.1]
  def change
    rename_column :listings, :user_id, :tenant_id
  end
end
