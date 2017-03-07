Rails.application.routes.draw do

  resources :experiment_tasks
  resources :tasks
  resources :experiments
  resources :visualisations do
      get :recreate
      get :tasks
      post :submit_json
  end

  root 'home#index'
end
