Rails.application.routes.draw do
  root to: 'pages#index'

  namespace :api do
    namespace :v1 do
      get 'iss-position', to: 'position#show'
      get 'astronauts', to: 'astronauts#index'
    end
  end
end
