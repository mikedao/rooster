Rails.application.routes.draw do
   put '/api/v1/cohorts', to: 'api/v1/cohorts#update'
   get '/api/v1/cohorts', to: 'api/v1/cohorts#index'
   get '/api/v1/cohorts/:id', to: 'api/v1/cohorts#show'
   get '/api/v1/search/students', to: 'api/v1/search/students#index'
end
