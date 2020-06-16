Rails.application.routes.draw do
  get 'companies/new'
  root    'static_pages#home'
  get     '/signup',          to: 'users#new'
  get     '/login',             to: 'sessions#new'
  post    '/login',            to: 'sessions#create'
  delete  '/logout',          to: 'sessions#destroy'
  get     '/logout',          to: 'sessions#destroy'
  get     '/signcompany',     to: 'companies#new'
  post     '/signcompany',     to: 'companies#create'
  resources :users
  resources :companies
end
