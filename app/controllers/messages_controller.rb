class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_chat_room

  def create
    @message = current_user.messages.build(message_params)
    @message.chat_room_id = @chat_room.id
    @message.save!
    flash[:success] = 'Your message was sent'
    redirect_to chat_room_path(@chat_room)
  end

  private

  def message_params
    params.require(:message).permit(:attachment, :body)
  end

  def find_chat_room
    @chat_room = ChatRoom.find_by(id: params[:chat_room_id])
  end
end
