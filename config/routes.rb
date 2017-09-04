Rails.application.routes.draw do

  get 'message/new', to: 'message#new', as: 'new_message'

  get 'message/:id', to: 'message#show', as: 'show_message'

  post '/messages', to: 'message#create'



  get 'home', to: 'user#home', as: 'home'

  get 'login', to: 'user#login', as: 'login'

  post 'user', to: 'user#show'

  get 'signup', to: 'user#signup', as: 'signup'

  post '/users', to: 'user#create'

  get 'logout', to: 'user#logout'

end
