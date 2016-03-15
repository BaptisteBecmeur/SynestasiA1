Rails.application.routes.draw do

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

  get '/play', to: 'games#play'
  get '/welcome', to: 'games#welcome'
  post '/check', to: 'games#check'
  get '/loose', to: 'games#loose'
  get '/congrat', to: 'games#congrat'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
