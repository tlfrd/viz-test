Rails.application.routes.draw do

  resources :experiment_tasks
  resources :tasks do
      get :preview
  end
  resources :experiments
  resources :visualisations do
      get :recreate
      post :submit_json
  end

  root 'home#index'
end
