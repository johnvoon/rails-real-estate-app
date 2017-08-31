class ChatRoomUsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chatroom

  def destroy
    @chat_room_user = @chat_room.chat_room_users.where(user_id: current_user.id).destroy_all
    redirect_to chat_rooms_path
  end

  private

  def set_chatroom
    @chatroom = ChatRoom.find(params[:chat_room_id])
  end
end
