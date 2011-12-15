Virtucoach::Application.routes.draw do

  resource :sessions
  resources :users
  resources :workouts
  
  root to: "workouts#index"

end
