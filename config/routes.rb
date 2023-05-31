Rails.application.routes.draw do
  #reestructura el codigo como si fueran carpetas --- Ponemos path y as vacios para que solo este nivel codigo
  namespace :authentication, path: '', as: '' do
    resources :users, only: [:new, :create], path: '/register', path_names: { new: '/'}
    resources :sessions, only: [:new, :create, :destroy], path: '/login', path_names: { new: '/'}
  end

  resources :categories, except: :show
  #refactor
  resources :products, path: '/'


end
