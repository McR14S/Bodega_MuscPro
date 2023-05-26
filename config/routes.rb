Rails.application.routes.draw do
  resources :categories, except: :show
  #refactor
  resources :products, path: '/'

  #reestructura el codigo como si fueran carpetas --- Ponemos path y as vacios para que solo este nivel codigo
  namespace :authentication, path: '', as: '' do
    resources :users, only: [:new, :create]
  end
end
