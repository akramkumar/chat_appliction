Rails.application.routes.draw do

  get 'conversations/:user_id' , to: 'conversations#show'
  get 'conversations/:search' , to: 'conversations#index'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  delete "conversations/:conversation_id/messages/:id", to: 'messages#destroy'
  root "conversations#index"
  resources :conversations do
    resources :messages, only: [:create]
  end
end
