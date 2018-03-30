Rails.application.routes.draw do
  root 'home#index'

  resource :user, only: [:edit] do
    collection do
      patch 'update_password'
    end
  end
  
  devise_for :users, controllers: {
              omniauth_callbacks: 'users/omniauth_callbacks',
              sessions: 'users/sessions',
              registrations: 'users/registrations',
              passwords: 'users/passwords'
            }

  devise_for :admins

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
end
