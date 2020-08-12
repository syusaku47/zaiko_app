Rails.application.routes.draw do
  get "login" => "users#login_form"
  post "login" => "users#login"
  post "logout" => "users#logout"
  get "users/index" => "users#index"
  get "users/new" => "users#new"
  post "users/create" => "users#create"
  get "users/:id/info" => "users#info"
  get "users/:id/edit" => "users#edit"
  post "users/:id/update" => "users#update" 
  post "users/:id/destroy" => "users#destroy"

  post "stocks/unit_price" => "stocks#unit_price"
  post "stocks/change" => "stocks#change"
  get "stocks/new"   => "stocks#new"
  post "stocks/create"   => "stocks#create"
  get "stocks/edit_all"   => "stocks#edit_all"
  post "stocks/:f/update_all"   => "stocks#update_all"
  get "stocks/add_all"  => "stocks#add_all"
  get "stocks/index" => "stocks#index"
  post "stocks/:id/destroy" => "stocks#destroy"
  post "stocks/:id/update"  => "stocks#update"
  post "stocks/:id/decrease" => "stocks#decrease"
  post "stocks/:id/increase" => "stocks#increase"
  get "stocks/:id"  => "stocks#edit"
  
  root 'home#top'
  get "home/howto" => "home#howto"
  get "home/about" => "home#about"
  get 'test', to: 'home#test' 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end