Rails.application.routes.draw do

  resources :visualisations do
      get :recreate
      get :tasks
      post :submit_json
  end

  root 'home#index'
end
