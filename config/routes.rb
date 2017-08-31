Rails.application.routes.draw do
  devise_for :users
  resources :listings
  resources :messages
  resources :chat_rooms do
    resource :chat_room_users
  end

  root 'listings#index'

  mount ActionCable.server => '/cable'
end
