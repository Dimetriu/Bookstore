Rails.application.routes.draw do
  devise_for :admins
  root 'home#index'
  
  devise_for :users
  # devise_for :users, controllers: {
  #             omniauth_callbacks: 'users/omniauth_callbacks',
  #             sessions: 'users/sessions',
  #             passwords: 'users/passwords'
  #           }

  # devise_for :admins

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
end
