Rails.application.routes.draw do
  resources :notifications
  resources :projects
  devise_for :users, :controllers => {
    :registrations => "users/registrations",
    :sessions => "users/sessions",
    :password => "users/password"
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
