class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat_room

  def timestamp
    created_at.strftime("%d %b %Y %k:%M %P")
  end
end
