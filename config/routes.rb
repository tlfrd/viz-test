Rails.application.routes.draw do

  resources :experiment_results do
    get :download
  end
  resources :experiment_tasks
  resources :tasks do
      get :preview
  end
  resources :experiments do
      get "preview/:position", :to => "experiments#preview", :as => "preview"
      get "create_instance"
      get "create_and_start_instance", :to => "experiments#create_and_start_instance", :as => "create_and_start_instance"
      get "task_result/:experiment_task_result_id", :to => "experiments#experiment_task_result", :as => "view_experiment_task_result"
  end
  resources :visualisations

  get "start/:experiment_uuid", :to => "experiments#public_show", :as => "public_show"

  get "run/:uuid", :to => "experiments#run_experiment", :as => "run_experiment"
  get "run/:uuid/task/:position", :to => "experiments#run_experiment", :as => "run_experiment_pos"
  get "completed/:uuid/", :to => "experiments#submit_result", :as => "submit_experiment_result"
  get "completed/:uuid/task_result/:experiment_task_id", :to => "experiments#public_experiment_task_result", :as => "public_experiment_task_result"
  get "results/:uuid", :to => "experiments#view_results", :as => "view_experiment_result"
  post "submit/:uuid/task/:position", :to => "experiments#submit_task_result", :as => "submit_task_result"

  get "experiment_tasks/new/:experiment_id", :to => "experiment_tasks#new", :as => "with_experiment"

  get "results", :to => "results#index"
  get "experiment_task_results", :to => "results#experiment_task_results", :as => "experiment_task_results_index"
  get "results/experiment_task_result/:id", :to => "results#experiment_task_result", :as => "all_experiment_task_results"

  root 'visualisations#index'
end
