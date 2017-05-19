Rails.application.routes.draw do

  root 'main#index'

  resources :players, except: [:new, :edit]
  resources :types, except: [:new, :edit]
  resources :badges, except: [:new, :edit]

  #Player Records.
  get '/records' => "records#index"
  get '/records/login'
  get '/records/contribution'
  get '/records/reinforcement'
  get '/records/dissemination'

  #Core of Metagame
  get '/activities' => "activities#record_activity"

  #Statistics
  get '/statistics/total_players'
  get '/statistics/players_distribution'
  get '/statistics/daily_activity'

end
