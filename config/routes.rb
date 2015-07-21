Rails.application.routes.draw do

  get "login" => "sessions#new", :as => "login"  
  get "logout" => "sessions#destroy", :as => "logout"  
  get "signup" => "users#new", :as => "signup"    
  root 'users#new'
  resources :users
  resources :sessions

end
