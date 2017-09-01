class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat_room
  has_attached_file :attachment
  do_not_validate_attachment_file_type :attachment

  def timestamp
    created_at.strftime('%d %b %Y %k:%M %P')
  end
end
