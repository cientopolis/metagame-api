Rails.application.routes.draw do

  root 'main#index'

  resources :players, except: [:new, :edit]
  resources :types, except: [:new, :edit]
  resources :badges, except: [:new, :edit]

  get '/records' => "records#index"
  get '/records/login'
  get '/records/contribution'
  get '/records/reinforcement'
  get '/records/dissemination'

  get '/activities' => "activities#record_activity"

end
