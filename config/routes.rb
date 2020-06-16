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
  get     '/addclient',     to: 'clients#new'
  post     '/addclient',     to: 'clients#create'
  get     '/addlesson',     to: 'lessons#new'
  post     '/addlesson',     to: 'lessons#create'
  resources :users
  resources :companies
  resources :lessons
  resources :clients
end
