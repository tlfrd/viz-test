Rails.application.routes.draw do

  # visualisations
  resources :visualisations
  get "visualisations/tag/:tag", :to => "visualisations#tag_index", :as => "group_by_tags"

  # tasks
  resources :tasks do
    get :preview
    post :add_coordinates
    post "remove_coordinates/:position", :to => "tasks#remove_coordinates", :as => "remove_coordinates"
  end

  # experiment tasks
  resources :experiment_tasks
  get "experiment_tasks/new/:experiment_id", :to => "experiment_tasks#new", :as => "with_experiment"

  # experiments
  resources :experiments do
    post "open", :to => "experiments#open", :as => "open"
    post "close", :to => "experiments#close", :as => "close"    
    get "preview/:position", :to => "experiments#preview", :as => "preview"
    get "create_instance"
    post "create_and_start_instance", :to => "experiments#create_and_start_instance", :as => "create_and_start_instance"
    get "task_result/:experiment_task_result_id", :to => "experiments#experiment_task_result", :as => "view_experiment_task_result"
  end
  get "start/:experiment_uuid", :to => "experiments#public_show", :as => "public_show"  
  get "run/:uuid", :to => "experiments#run_experiment", :as => "run_experiment"
  get "run/:uuid/task/:position", :to => "experiments#run_experiment", :as => "run_experiment_pos"
  get "completed/:uuid/", :to => "experiments#submit_result", :as => "submit_experiment_result"
  get "completed/:uuid/task_result/:experiment_task_id", :to => "experiments#public_experiment_task_result", :as => "public_experiment_task_result"
  get "results/:uuid", :to => "experiments#view_results", :as => "view_experiment_result"
  post "submit/:uuid/task/:position", :to => "experiments#submit_task_result", :as => "submit_task_result"

  # experiment results
  resources :experiment_results, :defaults => { :format => :json }
  get "results/experiment_task_result/:id", :to => "results#experiment_task_result", :as => "all_experiment_task_results"
  get "experiment_results/show_all/:id/", :to => "experiment_results#show_all", :as => "experiment_all_results", :defaults => { :format => :json }
  get "experiment_task_results/experiment/:experiment_id/", :to => "results#experiment_task_results_for_experiment", :as => "experiment_task_results_for_experiment"

  root 'visualisations#index'
end
