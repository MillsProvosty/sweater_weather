Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get 'forecast', to: 'forecasts#show'
      get 'backgrounds', to: 'backgrounds#show'
      get 'users', to: 'users#create'
    end
  end
end
