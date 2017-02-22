Rails.application.routes.draw do

  get 'users' => 'admin#show'

  post 'users/create' => 'users#create'

  get 'users/new' => 'users#new'

  get 'users/:id' => 'users#show'

  get 'users/:id/edit' => 'users#edit'

  post 'users/update' => 'users#update'

  post 'users/login' => 'users#login'

  post 'users/logout' => 'users#logout'

  get 'users/:id/destroy' => 'users#destroy'

end
