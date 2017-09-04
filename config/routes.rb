Rails.application.routes.draw do

  get 'message/new', to: 'message#new', as: 'new_message'

  get 'message/:id', to: 'message#show', as: 'show_message'

  post '/message', to: 'message#create'

  get 'user/home', as: 'home'

  get 'user/login', as: 'login'

  post '/user', to: 'user#create'

  get 'user/signup', as: 'signup'

end
