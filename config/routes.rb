Rails.application.routes.draw do
  resources :applications
  resources :shelters
  resources :pets
  resources :admins

  get '/', to: 'application#welcome'

  post '/applications/:id/pets/:id', to: 'application_pets#create'

  get '/shelters/:shelter_id/pets', to: 'shelters#pets'
  get '/shelters/:shelter_id/pets/new', to: 'pets#new'
  post '/shelters/:shelter_id/pets', to: 'pets#create'

  get '/admin/shelters', to: 'admin_shelters#index'
  get '/admin/shelters/:id', to: 'admin_shelters#show'

  get 'admin/applications', to: 'admin_applications#index'
  get '/admin/applications/:id', to: 'admin_applications#show', as: 'adminappshow'
  # patch '/admin/applications/:id', to: 'admin/applications#update', as: 'adminapp'
  patch '/admin/applications/:id', to: 'admin_applications#update', as: 'adminappupdate'

  # patch '/pets/:id/edit'
end
