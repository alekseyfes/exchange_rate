require 'sidekiq/web'

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#main'

  get '/admin' => 'admin#index'
  post '/admin/set_rate' => 'admin#set_rate'

  mount Sidekiq::Web => '/sidekiq', as: :sidekiq
end
