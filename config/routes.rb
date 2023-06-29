Rails.application.routes.draw do
  root   'ramunes#show'
  get    '/ramunelist', to: 'ramunes#new'
  post   '/ramunelist', to: 'ramunes#create'
  patch  '/ramunelist', to: 'ramunes#update'
  get    '/signup',     to: 'users#new'
  post   '/signup',     to: 'users#create'
  get    '/users/:id',  to: 'users#show',    as: 'profile'
  delete '/users/:id',  to: 'users#destroy', as: 'unsubscribe'
  get    '/login',      to: 'sessions#new'
  post   '/login',      to: 'sessions#create'
  delete '/logout',     to: 'sessions#destroy'
end