# frozen_string_literal: true

Rails.application.routes.draw do
  # https://js-from-routes.netlify.app/guide/#getting-started

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Use export: true to specify which routes should be taken into account when generating JS.

  resource :home, controller: :home, only: %i[show]
  root 'home#show'
end
