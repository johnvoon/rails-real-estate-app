class ChatRoomsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_rooms_#{params['chat_room_id']}_channel"
  end

  def unsubscribed; end

  def send_message(data)
    new_message = current_user.messages.create!(
      body: data['message'],
      chat_room_id: data['chat_room_id']
    )
    MessageBroadcastJob.perform_later(
      new_message,
      current_user.id
    )
  end
end
