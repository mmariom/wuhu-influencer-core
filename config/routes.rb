Rails.application.routes.draw do
  devise_for :sellers, controllers: { registrations: 'sellers/registrations' }

  # Scope your routes to the 'sellers' namespace to match your controller
  scope module: :sellers do
    resources :registrations, only: [] do
      get 'step/:id', to: 'registrations#show', as: :registration_step, on: :collection
      put 'step/:id', to: 'registrations#update', on: :collection
      patch 'step/:id', to: 'registrations#update', on: :collection
    end
  end

  root to: 'dashboard#index'
end


# Rails.application.routes.draw do
#   devise_for :users, controllers: {
#     sessions: 'users/sessions'
#   }
# end