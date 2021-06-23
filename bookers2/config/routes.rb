Rails.application.routes.draw do
  devise_for :users
  root to:'homes#top'
  resources:books
  get'home/about' =>'homes#about'
  resources :users, only: [:index, :show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
