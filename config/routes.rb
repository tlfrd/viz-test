Rails.application.routes.draw do

  resources :visualisations do
      get :recreate
      get :tasks
  end

  root 'home#index'
end
