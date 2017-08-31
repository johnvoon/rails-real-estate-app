class AddTenantBelongsToUser < ActiveRecord::Migration[5.1]
  def change
    add_reference :tenants, :user, index: true, foreign_key: true
  end
end
