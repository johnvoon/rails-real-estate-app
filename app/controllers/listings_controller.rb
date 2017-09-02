class ListingsController < ApplicationController
  def index
    @listings = Listing.includes(:address).order('created_at DESC')
  end

  def show
    @listing = Listing.search(params[:search])
    @chat_room = ChatRoom.new
  end
end
