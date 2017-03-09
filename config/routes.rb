Rails.application.routes.draw do

  resources :experiment_tasks
  resources :tasks do
      get :preview
  end
  resources :experiments do
      get "preview/:position", :to => "experiments#preview"
  end
  resources :visualisations do
      get :recreate
      post :submit_json
  end

  root 'home#index'
end
