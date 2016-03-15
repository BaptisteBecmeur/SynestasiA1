Rails.application.routes.draw do
  get 'tests/welcome'

  get 'tests/play'

  get 'tests/check'

  get 'tests/loose'

  get 'tests/congrat'

  devise_for :users

  get 'synestesie', to: 'pages#synestesie'
  get 'about', to: 'pages#about'
  get 'start', to: 'pages#start'
  get 'contact', to: 'pages#contact'
  get 'legal', to: 'pages#legal'

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
