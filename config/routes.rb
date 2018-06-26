Rails.application.routes.draw do
  resources :notifications
  resources :projects
  devise_for :users, :controllers => {
    :registrations => "users/registrations",
    :sessions => "users/sessions"
  }

  resource :users, only: [:edit] do
    collection do
      patch 'update_password'
    end
  end
  resource :profiles, only: [:edit] do
    collection do
      patch 'update_profile'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
