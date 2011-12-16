Virtucoach::Application.routes.draw do

  resource :sessions
  resources :users
  resources :workouts
  resources :comments
  
  root to: "sessions#new"

end
