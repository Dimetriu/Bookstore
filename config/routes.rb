Rails.application.routes.draw do
  root 'home#index'
  
  devise_for :users, controllers: { omiauth_callbacks: 'users/omniauth_callbacks' }
  
  devise_for :admins

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
end
