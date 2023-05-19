Rails.application.routes.draw do
  resources :categories, except: :show
  #refactor
  resources :products, path: '/'
end
