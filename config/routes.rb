Rails.application.routes.draw do
  root to: 'pages#index'

  namespace :api do
    namespace :v1 do
      get 'iss-position', to: 'position#show'
    end
  end
end
