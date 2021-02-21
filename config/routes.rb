Rails.application.routes.draw do
  get 'sessions/new'
  resources:users
  resources:sessions
  resources:microposts
 root 'static_pages#home'
get '/help',to: 'static_pages#help'
get '/about',to: 'static_pages#about'
get '/new',to: 'users#index'
post '/micropost',to: 'microposts#create'
get'/login',to: 'sessions#new'
post'/login',to: 'sessions#create'
delete '/logout',to: 'sessions#destroy'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
