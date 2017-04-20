Rails.application.routes.draw do

  resources :experiment_tasks
  resources :tasks do
      get :preview
  end
  resources :experiments do
      get "preview/:position", :to => "experiments#preview", :as => "preview"
      get "create_instance"
  end
  resources :visualisations
  # resources :visualisations do
  #     get :recreate
  #     post :submit_json
  # end

  get "run/:uuid", :to => "experiments#run_experiment", :as => "run_experiment"
  get "run/:uuid/task/:position", :to => "experiments#run_experiment", :as => "run_experiment_pos"
  get "completed/:uuid/", :to => "experiments#submit_result", :as => "submit_experiment_result"
  get "results/:uuid", :to => "experiments#view_results", :as => "view_experiment_result"
  post "submit/:uuid/task/:position", :to => "experiments#submit_task_result", :as => "submit_task_result"

  get "experiment_tasks/new/:experiment_id", :to => "experiment_tasks#new", :as => "with_experiment"

  get "results", :to => "results#index"

  root 'visualisations#index'
end
