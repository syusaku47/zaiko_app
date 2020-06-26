Rails.application.routes.draw do
  get "login" => "users#login_form"
  post "login" => "users#login"
  post "logout" => "users#logout"
  get "users/index" => "users#index"
  get "users/new" => "users#new"
  post "users/create" => "users#create"

  post "stock/:f/update"  => "stock#update"
  post "stock/:id/destroy" => "stock#destroy"
  get "stock/new"   => "stock#new"
  post "stock/create"   => "stock#create"
  get "stock/edit"   => "stock#edit"
  post "stock/update"   => "stock#update"
  get "stock/add"     => "stock#add"
  get "stock/index" => "stock#index"
  
  root 'home#top'
  get "home/howto" => "home#howto"
  get "home/about" => "home#about"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end