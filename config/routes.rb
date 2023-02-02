Rails.application.routes.draw do
  devise_for :users
  # https://js-from-routes.netlify.app/guide/#getting-started

  # Use export: true to specify which routes should be taken into account when generating JS. 
  mount Sidekiq::Web => "/sidekiq" if defined?(Sidekiq) # monitoring console
  resource :home, only: %i[show]
  root "home#show"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
