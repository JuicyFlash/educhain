Rails.application.routes.draw do
  resource :session
  resource :message
  resources :passwords, param: :token

  get "up" => "rails/health#show", as: :rails_health_check

  get :sign_up, to: "users#new"
  post :sign_up, to: "users#create"

  root "messages#index"
end
