Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do 
      get '/info', to: "users#info"
      post "/login", to: "users#login"
      resources :contracts, only: [:index, :search]
    end
  end
end
