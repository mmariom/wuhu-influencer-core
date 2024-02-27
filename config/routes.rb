Rails.application.routes.draw do
  post '/set_language/:locale', to: 'application#set_language'
  devise_for :sellers, controllers: { registrations: 'sellers/registrations', confirmations: 'sellers/confirmations'}
  get '/dashboard', to: 'dashboard#index'
  devise_scope :seller do
    authenticated :seller do
      root to: 'dashboard#index', as: :authenticated_root
    end

    unauthenticated :seller do
      root to: 'sellers/registrations#new', as: :unauthenticated_root
    end
    get '/sellers/:id', to: 'sellers/registrations#show'
    get '/sellers/:id', to: 'sellers/confirmations#show'
    get '/sellers/:id', to: 'sellers/addresses#show'
  end

  namespace :sellers do
    resources :companies, only: [:create]
    resources :addresses, only: [:create, :edit]
    patch '/addresses/:identification_number', to: 'addresses#update', as: :address
  end
end
