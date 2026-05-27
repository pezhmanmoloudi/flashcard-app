require "sidekiq/web"

Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  # Sidekiq web UI — restrict to authenticated admins once auth is in place
  mount Sidekiq::Web => "/sidekiq" if Rails.env.development?

  namespace :api do
    namespace :v1 do
      get  "health",       to: "health#show"
      post "auth/signup",  to: "auth#signup"
      post "auth/login",   to: "auth#login"
      get  "profile",      to: "profiles#show"
      resources :decks
    end
  end
end
