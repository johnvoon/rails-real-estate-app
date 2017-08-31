class RemoveTitleFromChatRooms < ActiveRecord::Migration[5.1]
  def change
    remove_column :chat_rooms, :title, :string
  end
end
