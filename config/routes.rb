Rails.application.routes.draw do
   put '/api/v1/cohorts', to: 'api/v1/cohorts#update'
   get '/api/v1/cohorts', to: 'api/v1/cohorts#index'
end
