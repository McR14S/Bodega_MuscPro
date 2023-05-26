Rails.application.routes.draw do
  resources :categories, except: :show
  #refactor
  resources :products, path: '/'

  #reestructura el codigo como si fueran carpetas
  namespace :authentication do
    resources :users, only: [:new, :create]
  end
end
