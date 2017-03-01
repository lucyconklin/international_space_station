Rails.application.routes.draw do
  resources :date_of_next_passovers
  root to: 'pages#index'

  namespace :api do
    namespace :v1 do
      get 'iss-position', to: 'position#show'
      get 'astronauts', to: 'astronauts#index'
      get 'pass-time', to: 'passes#show'
      post 'reminders', to: 'reminders#create'
    end
  end
end
