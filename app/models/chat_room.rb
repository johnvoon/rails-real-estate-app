class ChatRoom < ApplicationRecord
  has_many :chat_room_users
  has_many :users, through: :chat_room_users
  has_many :messages, -> { order(created_at: :desc) }

  def first_message
    messages.first
  end

  def other_participant(current_user)
    users.where("user_id != #{current_user.id}").first
  end
end
