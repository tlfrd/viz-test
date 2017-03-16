Rails.application.routes.draw do

  resources :experiment_tasks
  resources :tasks do
      get :preview
  end
  resources :experiments do
      get "preview/:position", :to => "experiments#preview"
      get "run/:experiment_result_id/step/:position", :to => "experiments#run"
      get "submit_result/:experiment_result_id/step/:position", :to => "experiments#submit_result"
  end
  resources :visualisations do
      get :recreate
      post :submit_json
  end

  root 'home#index'
end
