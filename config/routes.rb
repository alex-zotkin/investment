Rails.application.routes.draw do
  root to: 'home#index'

  get '/login', to: 'auth#login'
  post '/login', to: 'auth#login'

  get '/register', to: 'auth#register'
  post '/register', to: 'auth#create'

  get '/logout', to: 'auth#logout'

  get '/investment', to: 'invest#index'
  post '/investment/add', to: 'invest#add'
  post '/investment/allinfoaboutuser', to: 'invest#allInfoAboutUser'
  post '/investment/setinvestcount', to: 'invest#setInvestCount'
  delete '/investment/deleteinvest/:id', to: 'invest#delete'

  get '/profile', to: 'profile#index'
  post '/profile', to: 'profile#save'

end
