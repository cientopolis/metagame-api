Rails.application.routes.draw do

  root 'main#index'

  resources :players, except: [:new, :edit]
  resources :types, except: [:new, :edit]
  resources :badges, except: [:new, :edit]

  get '/activities' => "activity#activity"

end
