Rails.application.routes.draw do
  if Rails.env.development?
    mount Lookbook::Engine, at: "/lookbook"
  end

  get "courses/index"
  resource :session
  resources :passwords, param: :token

  get "up" => "rails/health#show", as: :rails_health_check

  get :sign_up, to: "users#new"
  post :sign_up, to: "users#create"

  root "courses#index"
end
