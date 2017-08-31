class ChatRoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_listing_tenant_user

  def index
    @chat_rooms = ChatRoom.joins(:chat_room_users).where(
      chat_room_users: { user_id: current_user.id }
    ).order(created_at: :desc)
  end

  def show
    @chat_room = ChatRoom.find_by(id: params[:id])
    @messages = ChatRoom.includes(:messages).find_by(id: params[:id]).messages
    @message = Message.new
  end

  def new
    @chat_room = ChatRoom.new
  end

  def create
    # Create Chat Room
    @chat_room = ChatRoom.new
    @chat_room.save
    # Associate current user and listing tenant user with new chat room
    @chat_room_user_current = current_user.chat_room_users.build
    @chat_room_user_listing_tenant = @listing_tenant_user.chat_room_users.build
    @chat_room_user_current.chat_room_id = @chat_room.id
    @chat_room_user_listing_tenant.chat_room_id = @chat_room.id
    @chat_room_user_current.save
    @chat_room_user_listing_tenant.save

    redirect_to chat_room_path(@chat_room)
  end

  def find_listing_tenant_user
    @listing_tenant_user = User.find_by(id: params[:listing_tenant_user_id])
  end
end
