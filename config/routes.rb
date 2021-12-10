Rails.application.routes.draw do
  root to: 'home#index'

  get '/login', to: 'auth#login'
  post '/login', to: 'auth#login'

  get '/register', to: 'auth#register'
  post '/register', to: 'auth#register'

  get '/logout', to: 'auth#logout'

  get '/investment', to: 'investment#index'
  get '/investment/:isin', to: 'investment#show'
  get '/investment/add', to: 'investment#add'
  post '/investment/add', to: 'investment#add'

  get '/profile', to: 'profile#index'

end
