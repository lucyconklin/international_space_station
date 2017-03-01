Rails.application.routes.draw do
  root to: 'pages#index'

  namespace :api do
    namespace :v1 do
      get 'iss-position', to: 'position#show'
      get 'astronauts', to: 'astronauts#index'
      get 'pass-time', to: 'passes#show'
    end
  end
end
