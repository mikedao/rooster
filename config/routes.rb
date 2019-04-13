Rails.application.routes.draw do
   put '/api/v1/cohorts', to: 'api/v1/cohorts#update'
   get '/api/v1/cohorts', to: 'api/v1/cohorts#index'
   get '/api/v1/cohorts/active', to: 'api/v1/cohorts#active'
   get '/api/v1/cohorts/:id', to: 'api/v1/cohorts#show'
end
