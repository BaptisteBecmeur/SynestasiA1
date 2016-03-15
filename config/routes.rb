Rails.application.routes.draw do

  get 'games/welcome'

  get 'games/congrat'

  get 'games/play'

  get 'games/loose'

  get 'games/check'

  devise_for :users

  get 'synestesie', to: 'pages#synestesie'
  get 'about', to: 'pages#about'
  get 'start', to: 'pages#start'
  get 'contact', to: 'pages#contact'
  get 'legal', to: 'pages#legal'

  root to: 'pages#home'

  resources :answers do #drummers
    resources :questions, only: [:new, :create, :index, :destroy, :show]
  end
    resources :questions

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
