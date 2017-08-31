class AddOfficeToAddress < ActiveRecord::Migration[5.1]
  def change
    add_reference :addresses, :office, index: true
  end
end
